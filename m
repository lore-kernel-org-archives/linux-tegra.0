From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: pmc: convert PMC driver to support DT
 only
Date: Mon, 25 Feb 2013 08:43:13 -0700
Message-ID: <512B8691.5000702@wwwdotorg.org>
References: <1361515491-16199-1-git-send-email-josephl@nvidia.com> <1361515491-16199-2-git-send-email-josephl@nvidia.com> <20130222130516.GW23234@tbergstrom-lnx.Nvidia.com> <1361585022.1804.11.camel@jlo-ubuntu-64.nvidia.com> <51284615.6080808@wwwdotorg.org> <20130225142841.GJ23234@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130225142841.GJ23234-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/25/2013 07:28 AM, Peter De Schrijver wrote:
> On Sat, Feb 23, 2013 at 05:31:17AM +0100, Stephen Warren wrote:
...
>> Peter, can you confirm exactly which [PMC] HW versions, if any, are 100%
>> backwards-compatible?
>>
> 
> The major difference between the PMCs are the powerdomain IDs. The Tegra30 IDs
> are a strict superset of the Tegra20 IDs, but the Tegra114 IDs are not. There
> are differences in the CPU domains and 3D. The CPU domains aren't a problem I
> think because we won't powergate those domains directly using the PMC. We
> always program the flowcontroller to do the powergating on WFI. 3D is a
> different story however. We do powergate 3D under software control and the
> sequencing is different between Tegra30 and Tegra114. Also Tegra30 has 2
> domains for 3D while Tegra114 has only 1. Then of course Tegra114 lacks the
> SATA and PCIe domains because those features are missing compared to Tegra30.
> But the IDs haven't been reused. All in all I think it's best to explicitly
> require the driver to support the various SoCs.

That does sound like a good idea; a separate compatible value for each SoC.
