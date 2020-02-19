From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: memory-controller: Update example for
 Tegra124 EMC
Date: Wed, 19 Feb 2020 09:04:06 -0600
Message-ID: <CAL_JsqL5NzRcr6G-f0soGjb9p=+aJmU6xXEMQCLG7n0GSaxH1w@mail.gmail.com>
References: <20200114123821.2649367-1-thierry.reding@gmail.com> <CAL_JsqKJUdhjWx5z_-kedNNm4mD6oSGizqEQ57vxtGbMFySbbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKJUdhjWx5z_-kedNNm4mD6oSGizqEQ57vxtGbMFySbbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 14, 2020 at 12:32 PM Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Tue, Jan 14, 2020 at 6:38 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > The example in the Tegra124 EMC device tree binding looks like an old
> > version that doesn't contain all the required fields. Update it with a
> > version from the current DTS files to fix the make dt_binding_check
> > target.
> >
> > Reported-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../nvidia,tegra124-emc.yaml                  | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Thanks for fixing quickly.

Or not. I assumed you were going to send this via arm-soc given that's
where the problem was, but given it still hasn't appeared anywhere and
it's in master now I'll apply it.

Rob
