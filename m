From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Add missing Smaug revision
Date: Thu, 30 Jun 2016 15:04:22 +0900
Message-ID: <CAAVeFu++3FcPF=j-DAsoA5O5kt6BDPYYT-EeSpEF2u=8E7U9ig@mail.gmail.com>
References: <20160629085229.31350-1-acourbot@nvidia.com> <57738EC3.3070200@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57738EC3.3070200-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 29, 2016 at 6:02 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> On 29/06/16 09:52, Alexandre Courbot wrote:
>> The "google,smaug-rev2" string is missing from the compatible list of
>> Smaug's DT. The differences of rev2 are not relevant at our current
>> level of support and it boots just fine, so add it.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>> index 431266a48e9c..82a96bd27bc8 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>> @@ -11,7 +11,8 @@
>>       compatible = "google,smaug-rev8", "google,smaug-rev7",
>>                    "google,smaug-rev6", "google,smaug-rev5",
>>                    "google,smaug-rev4", "google,smaug-rev3",
>> -                  "google,smaug-rev1", "google,smaug", "nvidia,tegra210";
>> +                  "google,smaug-rev2", "google,smaug-rev1",
>> +                  "google,smaug", "nvidia,tegra210";
>>
>>       aliases {
>>               serial0 = &uarta;
>
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Olof, let us know if you have any comments on this? Looks like I missed
> this initially because the rev2 support had been broken out in the
> chrome-os kernel tree to support some specific features for this board.
> However, I think for now it is ok to include rev2 here as well for mainline.

This should be perfectly safe. If I run a diff between
tegra210-smaug-p1.dts and tegra210-smaug-p2.dts in the ChromeOS tree,
the only node that differs is sysedp-batmon-calc. The other node in
these files (spiflash) is identical.

Besides I don't think there are that many rev2s out there. :)
