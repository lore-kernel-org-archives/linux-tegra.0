From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v4.8-rc4
Date: Mon, 5 Sep 2016 20:38:50 +0100
Message-ID: <490eafaf-04f6-79e1-6b8d-ffe8e523e083@nvidia.com>
References: <1f415bf9-3f21-8516-e70c-e3bf65d7ea96@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1f415bf9-3f21-8516-e70c-e3bf65d7ea96-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 05/09/16 20:37, Jon Hunter wrote:
> Here are some basic Tegra test results for Linux v4.8-rc4.
> Logs and other details at:
> 
>     https://nvtb.github.io//linux/test_v4.8-rc4/20160828153103/
> 
> 
> Test summary
> ------------
> 
> Build: zImage:
>     FAIL: ( 1/ 2): multi_v7_defconfig

This build break has been fixed by the following commit:

https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?h=timers/urgent&id=98744b408c757901df57fa50cbd5826245dc3a1f

Cheers
Jon

-- 
nvpublic
