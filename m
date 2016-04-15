From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/7] soc/tegra: pmc: Register sub-devices of PMC
Date: Fri, 15 Apr 2016 10:31:23 -0600
Message-ID: <5711175B.8000701@wwwdotorg.org>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460473007-11535-6-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/12/2016 08:56 AM, Laxman Dewangan wrote:
> Register sub devices of the PMC to support multiple functionalities
> of PMC.
> The sub devices are the subnode of PMC DT node with containing the
> compatible string of sub devices as follows:
>
>          pmc@0,7000e400 {
> 		pmc-pad-control {
> 			compatible = "nvidia,tegra210-io-pad";
> 			::
> 		};
> 	};
>
> In this pmc-pad-control is the sub device of PMC and the device
> compatibility is nvidia,tegra210-io-pad.

Since I don't think anyone has mentioned this point on the public lists, 
I'll echo the earlier internal discussion on this patch. I think the PMC 
driver should handle this all entirely internally. The PMC HW module 
doesn't have well-defined sub-modules, and hence we shouldn't represent 
sub-modules in DT. DT should represent HW structure, not Linux SW structure.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
