From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH 13/13] drm/tegra: kick out simplefb
Date: Fri, 24 Nov 2017 22:42:59 +0100
Message-ID: <20171124214259.mot44jw6gbweyhju@qmqm.qmqm.pl>
References: <cover.1511544782.git.mirq-linux@rere.qmqm.pl>
 <89e22ee1c026b40a5bfa91de282d658b56dc8ee8.1511544782.git.mirq-linux@rere.qmqm.pl>
 <20171124205049.GB12811@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171124205049.GB12811@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 24, 2017 at 09:50:50PM +0100, Thierry Reding wrote:
> On Fri, Nov 24, 2017 at 06:53:34PM +0100, Micha³ Miros³aw wrote:
> > Kick out firmware fb when loading tegra driver.
> Cool. Can you provide some background on how you tested this? What is
> your firmware FB? That'd be useful information to put in the commit
> message. Also, nit: "tegra driver" -> "Tegra driver".

I checked this on my Asus TF300T, as I use simplefb for initial
boot messages.  simplefb uses framebuffer set up by the bootloader.

Best Regards,
Micha³ Miros³aw
