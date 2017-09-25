From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v4.14-rc2
Date: Mon, 25 Sep 2017 15:41:23 +0100
Message-ID: <403cde74-abd6-1ae7-b230-3a87054923ea@nvidia.com>
References: <dbdcc12f-b1fa-4160-1b96-32270a528eed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dbdcc12f-b1fa-4160-1b96-32270a528eed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry,

On 25/09/17 15:29, Jon Hunter wrote:
> Tegra baseline test results for v4.14-rc2
> 
> 
> Here are some basic Tegra test results for Linux v4.14-rc2.
> Logs and other details at:
> 
>     https://nvtb.github.io//linux/test_v4.14-rc2/20170924170104/
> 
> 
> Test summary
> ------------
> 
> Build: zImage:
>     FAIL: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Have you sent your DRM fixes yet? Seems the include path in the Tegra
DRM is still breaking the build.

Cheers
Jon

-- 
nvpublic
