From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/tegra: output: Don't leak OF node on error
Date: Thu, 16 Apr 2020 20:45:13 +0300
Message-ID: <20200416174513.GT4796@pendragon.ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-2-digetx@gmail.com>
 <20200416172727.GN4796@pendragon.ideasonboard.com>
 <304a2a58-0031-bf88-6290-e72ab025d8c5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <304a2a58-0031-bf88-6290-e72ab025d8c5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On Thu, Apr 16, 2020 at 08:30:24PM +0300, Dmitry Osipenko wrote:
> 16.04.2020 20:27, Laurent Pinchart пишет:
> > On Thu, Apr 16, 2020 at 08:24:04PM +0300, Dmitry Osipenko wrote:
> >> The OF node should be put before returning error in tegra_output_probe(),
> >> otherwise node's refcount will be leaked.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> Hello Laurent,
> 
> That is the fastest kernel review I ever got, thank you :)

I think I'm also guilty for the slowest kernel reviews ever, so maybe in
the end it will even out :-)

-- 
Regards,

Laurent Pinchart
