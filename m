From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 4/4] soc/tegra: pmc: Use the new reset APIs to manage
 reset controllers
Date: Mon, 24 Apr 2017 13:45:20 +0100
Message-ID: <e87a846b-4bbf-03cf-f3a6-99d5e468425c@nvidia.com>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
 <1492514488-27385-5-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492514488-27385-5-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 18/04/17 12:21, Vivek Gautam wrote:
> Make use of reset_control_array_*() set of APIs to manage
> an array of reset controllers available with the device.

Before we apply this patch, I need to check to see if the order of the
resets managed by the PMC driver matter. Today the order of the resets
is determined by the order they appear in the DT node and although the
new APIs work in the same way they do not guarantee this. So let me
check to see if we can any concerns about ordering here. Otherwise would
be nice to use these APIs.

Cheers
Jon

-- 
nvpublic
