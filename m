From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH 2/2] Add config files for Venice2 board
Date: Fri, 13 Sep 2013 15:09:51 -0600
Message-ID: <52337F1F.9070608@wwwdotorg.org>
References: <1378943336-9263-1-git-send-email-swarren@wwwdotorg.org> <1378943336-9263-2-git-send-email-swarren@wwwdotorg.org> <523101EA.7020704@wwwdotorg.org> <20130913132252.GN30013@tbergstrom-lnx.Nvidia.com> <52333AF6.9060208@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52333AF6.9060208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/13/2013 10:19 AM, Stephen Warren wrote:
> On 09/13/2013 07:22 AM, Peter De Schrijver wrote:
>> On Thu, Sep 12, 2013 at 01:51:06AM +0200, Stephen Warren wrote:
>>> On 09/11/2013 05:48 PM, Stephen Warren wrote:
>>>> This board is currently disabled by default due to lack of U-Boot support
>>>> in the mainline repository. If you wish to test this, do as follows:
>>>>
>>>> cd u-boot
>>>> git checkout some-branch-with-venice2-support
>>>> cd ../scripts
>>>> ./build --boards venice2 build
>>>
>>> Peter, do you have a Venice2 yet? If so, could I trouble you to apply
>>> the tegrarcm Tegra124 support patches from Allen, the cbootimage-configs
>>> and tegra-uboot-flasher-scripts patches from me, grab a downstream
>>> Venice2 U-Boot branch, and validate that it all works?
>>>
>>
>> It builds all fine, but flashing as such fails with:
>>
>> U-Boot SPL 2013.04-g4e07053 (Sep 13 2013 - 16:11:40)
...
>> SF: Unsupported manufacturer fc
>> Failed to initialize SPI flash at 0:0
>> No SPI flash selected. Please run `sf probe'
>> No SPI flash selected. Please run `sf probe'

Does the following solve that?

diff --git a/configs/venice2.config b/configs/venice2.config
index 15d0b67..4316a1a 100644
--- a/configs/venice2.config
+++ b/configs/venice2.config
@@ -5,4 +5,5 @@ config = {
     'flash-erase-size': 1048576,
     'flash-image': 'venice2-spi.img',
     'flash-type': 'spi',
+    'flash-id-uboot', '1:0',
 }
diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index f1abe54..41879c3 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -64,7 +64,8 @@ def gen_flashcmd_nand(flash_image_addr, flash_img_size):
     return flashcmd

 def gen_flashcmd_spi(flash_image_addr, flash_img_size):
-    flashcmd = 'sf probe 0 ; '
+    flash_id = config.get('flash-id-uboot', '0')
+    flashcmd = 'sf probe %s ; ' % flash_id
     flashcmd += 'sf erase 0 0x%08x ; ' % config['flash-erase-size']
     flashcmd += 'sf write 0x%08x 0 0x%08x ; ' % (flash_image_addr,
flash_img_size)
     return flashcmd
