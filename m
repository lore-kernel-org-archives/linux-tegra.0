From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4 0/9] ARM: tegra: add platform suspend support
Date: Tue, 19 Mar 2013 10:51:11 -0600
Message-ID: <5148977F.7000700@wwwdotorg.org>
References: <1363594400-11663-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363594400-11663-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 02:13 AM, Joseph Lo wrote:
> This series introduces a basic functionality for Tegra to support the
> platform suspend and resume.
> 
> Note: This series only adds the support for Tegra20 and Tegra30. The
> Tegra114 will be supported later.
> 
> This series needs the patch below that not yet be merged into linux-mmc tree
> to make the system suspend/resume function work correctly.
> "mmc: tegra: use mmc_of_parse to get the support of standard MMC DT bindings"

I assume this series needs to be applied after the 3-long series you
posted just before it, containing "ARM: dts: tegra: add clock source for
PMC", "ARM: tegra: get PMC clock source from DT", and "ARM: tegra:
moving the CPU power timer function to PMC driver"?
