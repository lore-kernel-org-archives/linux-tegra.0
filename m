From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: How to test new bootloaders on Jetson TX1? - ATF
Date: Sat, 17 Feb 2018 06:34:01 +0100
Message-ID: <5b1b68d4-e2c2-80e6-8a42-594053d1860c@suse.de>
References: <5ff3ffde-653c-ea50-490c-efcc6dccecc2@suse.de>
 <0247bb39-1f53-5c45-4d37-247813b53b96@nvidia.com>
 <8d80b0d3-eaed-b1ab-02c9-86f81ac4b7fa@suse.de>
 <33de1065-1372-282c-9646-30a63729e08e@nvidia.com>
 <71bf7527-3fb7-293f-8a1c-63ce74882649@suse.de>
 <fa89b123-bfcb-6f91-59cc-bae29aef19ab@nvidia.com>
 <d6a44448867a47028685fb0af0005d59@HQMAIL101.nvidia.com>
 <205465fc7b2f4547ac81c7394108e2c7@bgmail103.nvidia.com>
 <d219bbd4-df4c-f6b7-e64d-5f305fe5d854@suse.de>
 <e9728e54-8c58-4586-8863-0f26eb156deb@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e9728e54-8c58-4586-8863-0f26eb156deb-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-IBi9RG/b67k@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am 16.02.2018 um 07:18 schrieb Varun Wadekar:
> Yes. That's a custom SMC we have for some non-L4T uses. It has not been
> upstreamed yet.
> 
> You can add dummy handling in tegra_sip_calls.c to move forward.

Thanks, on my 1.4 based branch I succeeded to boot into Nvidia U-Boot
with the following change:

--- a/plat/nvidia/tegra/common/tegra_sip_calls.c
+++ b/plat/nvidia/tegra/common/tegra_sip_calls.c
@@ -162,6 +162,11 @@ uint64_t tegra_sip_handler(uint32_t smc_fid,
                 */
                break;

+       case 0x82000015:
+               INFO("%s: SMC 0x%x\n", __func__, smc_fid);
+               SMC_RET1(handle, 0);
+               break;
+
        default:
                ERROR("%s: unhandled SMC (0x%x)\n", __func__, smc_fid);
                break;

The INFO output shows up exactly once.

On master branch I've further needed to fix a regression:
https://github.com/ARM-software/arm-trusted-firmware/pull/1271

Regards,
Andreas

> 
> ------------------------------------------------------------------------
> *From:* Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> *Sent:* Thursday, February 15, 2018 7:04 PM
> *To:* Varun Wadekar
> *Cc:* Tom Warren; Jonathan Hunter; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; U-Boot;
> Alexander Graf; Mian Yousaf Kaukab
> *Subject:* Re: How to test new bootloaders on Jetson TX1? - ATF
> 
> Hi Varun,
> 
> Am 15.02.2018 um 17:57 schrieb Varun Wadekar:
>> Andreas, can you try the TOS packaging script available in our public repo?
>> 
>> http://nv-tegra.nvidia.com/gitweb/?p=3rdparty/ote_partner/tlk.git;a=blob;f=tools/gen_tos_part_img.py;h=47828f7028e56a6cffb9b773502b13dc431a015e;hb=HEAD
> 
> Great, that script does work. It is lacking usage output, but looking at
> the code, its arguments were self-documenting.
> 
>> Please let me know if this does not work for you.
>> 
>> For the upstream ATF code, our downstream has not caught up with upstream yet, so I am not sure if upstream would directly work for TX1. But its definitely worth a try.
> 
> I tried R28.1 flash.sh -k TOS with my ATF v1.4 with Spectre backports,
> without SPD. BL31 appears to initialize okay, but later something runs
> into an unhandled SMC 0x82000015 - things then go south and it doesn't
> reach the Nvidia U-Boot. Serial log attached.
> 
> According to
> https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/arm-sip-service.rst
> that SMC function ID falls into the SiP range, so indeed something
> Nvidia-specific missing in v1.4?
> 
> Regards,
> Andreas
> 
> https://build.opensuse.org/package/show/hardware:boot/arm-trusted-firmware-tegra210

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
