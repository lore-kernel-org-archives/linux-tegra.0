From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: tegra: Add host1x, dc and hdmi to Tegra114 device
 tree
Date: Thu, 29 Aug 2013 09:52:00 +0300
Message-ID: <521EEF90.8070907@nvidia.com>
References: <1377686459-16634-1-git-send-email-mperttunen@nvidia.com> <1377686459-16634-5-git-send-email-mperttunen@nvidia.com> <20130828122529.GB32254@ulmo> <521DEFFF.90507@nvidia.com> <20130828131815.GB604@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130828131815.GB604@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 28.08.2013 16:18, Thierry Reding wrote:
> I think that's not all. I have local patches that also introduce a v2 of
> host1x, because the number of syncpoints is different. There may also be
> other differences, but Terje might be more qualified to answer that.

Tegra4 host1x has an extra channel(totals 9), which caused bitfields in
a couple of registers to shift. The registers are mainly used in the
debug code to dump the channel FIFO. Same number of sync points as
Tegra3, but 12 wait bases.

Other changes are minor and driver already deals with them, for example
32-bit versus 16-bit sync point value comparison.

Terje
