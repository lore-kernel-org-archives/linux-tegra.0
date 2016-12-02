From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/2] arm64: tegra: Lost patches for v4.10-rc1
Date: Fri, 02 Dec 2016 21:25:33 +0100
Message-ID: <2425842.ADvFPDoOi6@wuerfel>
References: <20161202195756.16562-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161202195756.16562-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday, December 2, 2016 8:57:54 PM CET Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> As discussed on IRC, resending these two that seem to have fallen
> through the cracks. At least the first patch had been part of a pull
> request for v4.8 but ended up not being merged (although all the other
> patches in the request did).
> 
> Anyway, it'd be great to get these applied for v4.10-rc1.
> 

Applied both to next/fixes-non-critical for v4.10-rc1, and added
a cc:stable tag for the first one to trigger backports for
4.5+. Thanks,

	Arnd
