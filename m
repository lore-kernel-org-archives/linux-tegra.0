From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Mon, 26 Mar 2012 14:09:04 -0700
Message-ID: <CAEUnVG6nrnAoRLxu+gkiRo=Sid3N5ZS9C8+BCX8KtZqxo0nakA@mail.gmail.com>
References: <1324898081-10308-1-git-send-email-alokc@nvidia.com>
 <CAM=Q2cs+myCvph7OXvCDTG7y48oNTfRtjsDzQaKiEXzjdu3pzA@mail.gmail.com>
 <7A0BFCFE3DA5CD47B0FB7984326F201A13689D386F@BGMAIL01.nvidia.com>
 <7A0BFCFE3DA5CD47B0FB7984326F201A136B886672@BGMAIL01.nvidia.com> <4F58DEB8.9060103@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F58DEB8.9060103-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 8, 2012 at 8:30 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> =
wrote:
> On Mon, Dec 26, 2011 at 4:44 PM, Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrot=
e:
>> From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> In NACK error condition, I2C controller violates clock-to-data setup
>> time before stop. In Software, because of this reset of controller i=
s
>> happening before I2C controller could complete STOP condition.
>>
>> Added delay of 2 clock period before reset the controller in case of
>> NACK error.
>
> (CC list cut down to people who were active in the original patch
> posting thread)
>
> On 03/07/2012 11:29 PM, Alok Chauhan wrote:
>> Hi all,
>>
>> If there are no more concern then can we merge this patch to i2c teg=
ra driver?
>
> Alok, a couple comments:
>
> 1) The set of I2C maintainers has changed since you last posted this
> patch. You should resend the whole patch to make sure the new
> maintainers have a copy. I've CC'd Wolfram on this message, but you
> still need to repost since there's no way Wolfram can extract the pat=
ch
> from this email.
>
> 2) Wasn't there an outstanding question about the length of the delay
> here, and whether it negatively interfered with the TPM chips on some
> boards, since they always NACK the first transaction, which then need=
s
> to be retried quickly so the TPM doesn't go back to sleep? I don't
> recall you answering addressing that issue. There's no point repostin=
g
> without addressing all the issues. Also, I'm not sure whether
> Shubhrajyot or Ben consider the answers you gave to their questions
> satisfactory or not.
The TPM issue was from the inital patchset, this current patch works
with those slow TPMs.  The change to make the sleep duration dependent
on the i2c clock rate fixed it.  Sorry it took so long for me to test
it.

>
> P.S. Top-posting makes for confusing emails.
>
> Thanks.
>
>>> Signed-off-by: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>> Instead of setting constant value for delay as was in previous patc=
h,
>>> now in the current modification delay will be calculated based on c=
lock frequency of the bus.
>>>
>>> =A0drivers/i2c/busses/i2c-tegra.c | =A0 =A08 ++++++++
>>> =A01 files changed, 8 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>> b/drivers/i2c/busses/i2c-tegra.c index 6381604..62e197c 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -517,6 +517,14 @@ static int tegra_i2c_xfer_msg(struct
>>> tegra_i2c_dev *i2c_dev,
>>> =A0 =A0 =A0 =A0if (likely(i2c_dev->msg_err =3D=3D I2C_ERR_NONE))
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>>>
>>> + =A0 =A0 =A0 /*
>>> + =A0 =A0 =A0 =A0* In NACK error condition resetting of I2C control=
ler happens
>>> + =A0 =A0 =A0 =A0* before STOP condition is properly completed by I=
2C
>>> + controller,
>>> + =A0 =A0 =A0 =A0* so wait for 2 clock cycle to complete STOP condi=
tion.
>>> + =A0 =A0 =A0 =A0*/
>>
>>>>>> Why do you need to reset the controller in case of a NACK.
>>>>> This is required because of hardware limitations. Without reset w=
e can't flus the internal hardware registers.
>>
>>
>>> + =A0 =A0 =A0 if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(DIV_ROUND_UP(2 * 1000000,
>>> + i2c_dev->bus_clk_rate));
>>> +
>>> =A0 =A0 =A0 =A0tegra_i2c_init(i2c_dev);
>>> =A0 =A0 =A0 =A0if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (msg->flags & I2C_M_IGNORE_NAK)
>>> --
>>> 1.7.4.1
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
