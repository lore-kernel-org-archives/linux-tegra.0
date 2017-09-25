From: Shawn N <shawnn@chromium.org>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Mon, 25 Sep 2017 16:15:57 -0700
Message-ID: <CALaWCOM87ikjzK-zFJ7WT37L_w58AwZwC_nq0hNXuzh5x87n5w@mail.gmail.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com> <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
 <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com> <20170919171401.GA10968@google.com>
 <CALaWCOPzT-BWu-YcMY+xEAWGRmvvVEoA64ceEK3zG3K-wajskQ@mail.gmail.com>
 <20170920061317.GB13616@google.com> <CALaWCOPEiWHMeOb-9_fpbyYuNzGdy0favnPS37u5_zz1AG_86w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="089e08215428cf2d69055a0bbd60"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALaWCOPEiWHMeOb-9_fpbyYuNzGdy0favnPS37u5_zz1AG_86w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Olof Johansson <olof@lixom.net>, Benson Leung <bleung@chromium.org>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Brian Norris <computersforpeace@gmail.com>, Brian Norris <briannorris@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, Enric Balletbo <enric.balletbo@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

--089e08215428cf2d69055a0bbd60
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 20, 2017 at 1:22 PM, Shawn N <shawnn@google.com> wrote:
> On Tue, Sep 19, 2017 at 11:13 PM, Brian Norris <briannorris@chromium.org> wrote:
>> Hi,
>>
>> On Tue, Sep 19, 2017 at 11:05:38PM -0700, Shawn N wrote:
>>> This is failing because our EC_CMD_GET_PROTOCOL_INFO host command is
>>> getting messed up, or the reply buffer is getting corrupted somehow.
>>>
>>>                ec_dev->proto_version =
>>>                         min(EC_HOST_REQUEST_VERSION,
>>>                                         fls(proto_info->protocol_versions) - 1);
>>>
>
> Checking this closer, the first host command we send after we boot the
> kernel (EC_CMD_GET_PROTOCOL_INFO) is failing due to protocol error
> (see 'SPI rx bad data' / 'SPI not ready' on the EC console). Since
> this doesn't seem to happen on the Chromium OS nyan_big release
> kernel, I suggest to hook up a logic analyzer and see if the SPI
> master is doing something bad.
>
> The error handling in cros_ec_cmd_xfer_spi() is completely wrong and
> we return -EAGAIN / EC_RES_IN_PROGRESS, which the caller interprets
> "the host command was received by the EC and is currently being
> handled, poll status until completion". So the caller polls status
> with EC_CMD_GET_COMMS_STATUS, sees no host command is in progress
> (which is interpreted to mean "the host command I sent previously has
> now successfully completed"), and returns success. The problem here is
> that the initial host command was never received at all, and no reply
> was ever received, so our reply data is all zero.
>
> Two things need to be fixed here:
>
> 1) Find out why the first host command after boot is failing. Probe
> SPI pins and see what's going on.
> 2) Fix error handling so we properly return an error (or properly
> retry the entire command) when a protocol error occurs (I made some
> attempt in https://chromium-review.googlesource.com/385080/, probably
> I should revisit that).

The below patch will fix error handling and will make things mostly
work on nyan_big, because we'll fall back to V2 protocol after the
initial failure. But we should still investigate why we're getting
errors on the first host command. We aren't seeing these errors when
we send commands from firmware, so I suspect something is wrong in
kernel SPI HW initialization that causes the first command to fail.

From: Shawn Nematbakhsh <shawnn@chromium.org>
Date: Mon, 25 Sep 2017 14:32:38 -0700
Subject: [PATCH] mfd: cros ec: spi: Fix "in progress" error signaling

For host commands that take a long time to process, cros ec can return
early by signaling a EC_RES_IN_PROGRESS result. The host must then poll
status with EC_CMD_GET_COMMS_STATUS until completion of the command.

None of the above applies when data link errors are encountered. When
errors such as EC_SPI_PAST_END are encountered during command
transmission, it usually means the command was not received by the EC.
Treating such errors as if they were 'EC_RES_IN_PROGRESS' results is
almost always the wrong decision, and can result in host commands
silently being lost.

Signed-off-by: Shawn Nematbakhsh <shawnn@chromium.org>
---
 drivers/mfd/cros_ec_spi.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index c9714072e224..d33e3847e11e 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -377,6 +377,7 @@ static int cros_ec_pkt_xfer_spi(struct
cros_ec_device *ec_dev,
        u8 *ptr;
        u8 *rx_buf;
        u8 sum;
+       u8 rx_byte;
        int ret = 0, final_ret;

        len = cros_ec_prepare_tx(ec_dev, ec_msg);
@@ -421,25 +422,22 @@ static int cros_ec_pkt_xfer_spi(struct
cros_ec_device *ec_dev,
        if (!ret) {
                /* Verify that EC can process command */
                for (i = 0; i < len; i++) {
-                       switch (rx_buf[i]) {
-                       case EC_SPI_PAST_END:
-                       case EC_SPI_RX_BAD_DATA:
-                       case EC_SPI_NOT_READY:
-                               ret = -EAGAIN;
-                               ec_msg->result = EC_RES_IN_PROGRESS;
-                       default:
+                       rx_byte = rx_buf[i];
+                       if (rx_byte == EC_SPI_PAST_END  ||
+                           rx_byte == EC_SPI_RX_BAD_DATA ||
+                           rx_byte == EC_SPI_NOT_READY) {
+                               ret = -EREMOTEIO;
                                break;
                        }
-                       if (ret)
-                               break;
                }
-               if (!ret)
-                       ret = cros_ec_spi_receive_packet(ec_dev,
-                                       ec_msg->insize + sizeof(*response));
-       } else {
-               dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
        }

+       if (!ret)
+               ret = cros_ec_spi_receive_packet(ec_dev,
+                               ec_msg->insize + sizeof(*response));
+       else
+               dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
+
        final_ret = terminate_request(ec_dev);

        spi_bus_unlock(ec_spi->spi->master);
-- 
2.12.2

>
>>> If proto_info->protocol_versions == 0 then ec_dev->proto_version will
>>> be assigned 0xffff. The logic here seems strange to me, if the EC is
>>
>> Whoops...
>>
>>> successfully replying to our v3 command then obviously it supports v3
>>> (maybe it will be useful someday if EC_HOST_REQUEST_VERSION is rev'd).
>>> Anyway, we need to figure out what is happening with our
>>> EC_HOST_REQUEST_VERSION host command.
>>>
>>> On Tue, Sep 19, 2017 at 10:14 AM, Brian Norris <briannorris@chromium.org> wrote:
>>> > Hi Jon,
>>> >
>>> > On Tue, Sep 19, 2017 at 05:39:56PM +0100, Jon Hunter wrote:
>>> >> On 19/09/17 15:09, Shawn N wrote:
>> ...
>>> > Furthermore, the only assignments to this 'proto_version' field look
>>> > like they're only writing one of 0, 2, 3, or
>>> >
>>> >    min(EC_HOST_REQUEST_VERSION, fls(proto_info->protocol_versions) - 1)
>>> >
>>> > . I don't see where 0xffff comes from.
>>
>> ...I'm an idiot. While the rvalue (the expression above) is an int (e.g,
>> -1), it's getting cast into a uint16_t (ec_dev->proto_version). So
>> that's where the 0xffff can come from.
>
> I saw that before and overlooked it too, so we're both idiots.
>
>>
>> Sorry if I misled you Shawn :(
>>
>> Brian

--089e08215428cf2d69055a0bbd60
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-mfd-cros-ec-spi-Fix-in-progress-error-signaling.patch"
Content-Disposition: attachment;
	filename="0001-mfd-cros-ec-spi-Fix-in-progress-error-signaling.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j80pem5p0

RnJvbSA5YTkwNzNiMDY5MDAxZjBkMjY1YjczNWUyNjNmMGY5ODIzOTY1ZTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGF3biBOZW1hdGJha2hzaCA8c2hhd25uQGNocm9taXVtLm9y
Zz4KRGF0ZTogTW9uLCAyNSBTZXAgMjAxNyAxNDozMjozOCAtMDcwMApTdWJqZWN0OiBbUEFUQ0hd
IG1mZDogY3JvcyBlYzogc3BpOiBGaXggImluIHByb2dyZXNzIiBlcnJvciBzaWduYWxpbmcKCkZv
ciBob3N0IGNvbW1hbmRzIHRoYXQgdGFrZSBhIGxvbmcgdGltZSB0byBwcm9jZXNzLCBjcm9zIGVj
IGNhbiByZXR1cm4KZWFybHkgYnkgc2lnbmFsaW5nIGEgRUNfUkVTX0lOX1BST0dSRVNTIHJlc3Vs
dC4gVGhlIGhvc3QgbXVzdCB0aGVuIHBvbGwKc3RhdHVzIHdpdGggRUNfQ01EX0dFVF9DT01NU19T
VEFUVVMgdW50aWwgY29tcGxldGlvbiBvZiB0aGUgY29tbWFuZC4KCk5vbmUgb2YgdGhlIGFib3Zl
IGFwcGxpZXMgd2hlbiBkYXRhIGxpbmsgZXJyb3JzIGFyZSBlbmNvdW50ZXJlZC4gV2hlbgplcnJv
cnMgc3VjaCBhcyBFQ19TUElfUEFTVF9FTkQgYXJlIGVuY291bnRlcmVkIGR1cmluZyBjb21tYW5k
CnRyYW5zbWlzc2lvbiwgaXQgdXN1YWxseSBtZWFucyB0aGUgY29tbWFuZCB3YXMgbm90IHJlY2Vp
dmVkIGJ5IHRoZSBFQy4KVHJlYXRpbmcgc3VjaCBlcnJvcnMgYXMgaWYgdGhleSB3ZXJlICdFQ19S
RVNfSU5fUFJPR1JFU1MnIHJlc3VsdHMgaXMKYWxtb3N0IGFsd2F5cyB0aGUgd3JvbmcgZGVjaXNp
b24sIGFuZCBjYW4gcmVzdWx0IGluIGhvc3QgY29tbWFuZHMKc2lsZW50bHkgYmVpbmcgbG9zdC4K
ClNpZ25lZC1vZmYtYnk6IFNoYXduIE5lbWF0YmFraHNoIDxzaGF3bm5AY2hyb21pdW0ub3JnPgot
LS0KIGRyaXZlcnMvbWZkL2Nyb3NfZWNfc3BpLmMgfCAyNiArKysrKysrKysrKystLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL2Nyb3NfZWNfc3BpLmMgYi9kcml2ZXJzL21mZC9jcm9z
X2VjX3NwaS5jCmluZGV4IGM5NzE0MDcyZTIyNC4uZDMzZTM4NDdlMTFlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL21mZC9jcm9zX2VjX3NwaS5jCisrKyBiL2RyaXZlcnMvbWZkL2Nyb3NfZWNfc3BpLmMK
QEAgLTM3Nyw2ICszNzcsNyBAQCBzdGF0aWMgaW50IGNyb3NfZWNfcGt0X3hmZXJfc3BpKHN0cnVj
dCBjcm9zX2VjX2RldmljZSAqZWNfZGV2LAogCXU4ICpwdHI7CiAJdTggKnJ4X2J1ZjsKIAl1OCBz
dW07CisJdTggcnhfYnl0ZTsKIAlpbnQgcmV0ID0gMCwgZmluYWxfcmV0OwogCiAJbGVuID0gY3Jv
c19lY19wcmVwYXJlX3R4KGVjX2RldiwgZWNfbXNnKTsKQEAgLTQyMSwyNSArNDIyLDIyIEBAIHN0
YXRpYyBpbnQgY3Jvc19lY19wa3RfeGZlcl9zcGkoc3RydWN0IGNyb3NfZWNfZGV2aWNlICplY19k
ZXYsCiAJaWYgKCFyZXQpIHsKIAkJLyogVmVyaWZ5IHRoYXQgRUMgY2FuIHByb2Nlc3MgY29tbWFu
ZCAqLwogCQlmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKyspIHsKLQkJCXN3aXRjaCAocnhfYnVmW2ld
KSB7Ci0JCQljYXNlIEVDX1NQSV9QQVNUX0VORDoKLQkJCWNhc2UgRUNfU1BJX1JYX0JBRF9EQVRB
OgotCQkJY2FzZSBFQ19TUElfTk9UX1JFQURZOgotCQkJCXJldCA9IC1FQUdBSU47Ci0JCQkJZWNf
bXNnLT5yZXN1bHQgPSBFQ19SRVNfSU5fUFJPR1JFU1M7Ci0JCQlkZWZhdWx0OgorCQkJcnhfYnl0
ZSA9IHJ4X2J1ZltpXTsKKwkJCWlmIChyeF9ieXRlID09IEVDX1NQSV9QQVNUX0VORCAgfHwKKwkJ
CSAgICByeF9ieXRlID09IEVDX1NQSV9SWF9CQURfREFUQSB8fAorCQkJICAgIHJ4X2J5dGUgPT0g
RUNfU1BJX05PVF9SRUFEWSkgeworCQkJCXJldCA9IC1FUkVNT1RFSU87CiAJCQkJYnJlYWs7CiAJ
CQl9Ci0JCQlpZiAocmV0KQotCQkJCWJyZWFrOwogCQl9Ci0JCWlmICghcmV0KQotCQkJcmV0ID0g
Y3Jvc19lY19zcGlfcmVjZWl2ZV9wYWNrZXQoZWNfZGV2LAotCQkJCQllY19tc2ctPmluc2l6ZSAr
IHNpemVvZigqcmVzcG9uc2UpKTsKLQl9IGVsc2UgewotCQlkZXZfZXJyKGVjX2Rldi0+ZGV2LCAi
c3BpIHRyYW5zZmVyIGZhaWxlZDogJWRcbiIsIHJldCk7CiAJfQogCisJaWYgKCFyZXQpCisJCXJl
dCA9IGNyb3NfZWNfc3BpX3JlY2VpdmVfcGFja2V0KGVjX2RldiwKKwkJCQllY19tc2ctPmluc2l6
ZSArIHNpemVvZigqcmVzcG9uc2UpKTsKKwllbHNlCisJCWRldl9lcnIoZWNfZGV2LT5kZXYsICJz
cGkgdHJhbnNmZXIgZmFpbGVkOiAlZFxuIiwgcmV0KTsKKwogCWZpbmFsX3JldCA9IHRlcm1pbmF0
ZV9yZXF1ZXN0KGVjX2Rldik7CiAKIAlzcGlfYnVzX3VubG9jayhlY19zcGktPnNwaS0+bWFzdGVy
KTsKLS0gCjIuMTIuMgoK
--089e08215428cf2d69055a0bbd60--
