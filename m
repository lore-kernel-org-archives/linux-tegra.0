From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: tegra: Add la clock for Tegra210
Date: Thu, 21 Dec 2017 10:55:31 +0200
Message-ID: <20171221085531.GQ29417@tbergstrom-lnx.Nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
 <1510842542-16451-2-git-send-email-pdeschrijver@nvidia.com>
 <47980cf0-8837-bff1-a25a-1287dd96b689@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <47980cf0-8837-bff1-a25a-1287dd96b689-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 19, 2017 at 10:27:56PM +0000, Jon Hunter wrote:
> 
> On 16/11/17 14:28, Peter De Schrijver wrote:
> > This clock is needed by the memory built-in self test work around.
> 
> Can we say what this 'LA' clock is? What does LA stand for? Looks like
> this is only used for Host1x.
> 

I think it stands for Latency Allowance.

Peter.

> Cheers
> Jon
> 
> -- 
> nvpublic
