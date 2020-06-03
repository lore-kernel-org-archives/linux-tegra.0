From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: gr/gk20a: Use firmware version 0
Date: Thu, 4 Jun 2020 05:50:46 +1000
Message-ID: <CACAvsv7ecMSxhCTC6tJU63-aMJpoQn5-hkUpOjNFhJX1GAFQYQ@mail.gmail.com>
References: <20200603142002.3776672-1-thierry.reding@gmail.com> <CACvgo529m+fub=ZddGkjRXEY-7i3rRUs0EssYGf+DJgkcDm3Zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACvgo529m+fub=ZddGkjRXEY-7i3rRUs0EssYGf+DJgkcDm3Zg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 4 Jun 2020 at 01:43, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Wed, 3 Jun 2020 at 15:20, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Tegra firmware doesn't actually use any version numbers and passing -1
> > causes the existing firmware binaries not to be found. Use version 0 to
> > find the correct files.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Fixes: ef16dc278ec2 ("drm/nouveau/gr/gf100-: select implementation
> based on available FW")
> Reviewed-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Oops, my bad.  Merged.

Ben.

>
> -Emil
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
