From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 11/22] gpu: host1x: Initialize firewall class to the
 jobs one
Date: Wed, 14 Jun 2017 09:41:49 +0200
Message-ID: <CABPQNSZvpmz9Fi7fxdmfR0LE1L-SjaFHyNGxkYH_zSE2Uv==Cg@mail.gmail.com>
References: <cover.1497394243.git.digetx@gmail.com> <8c0a2417584ce51b716f2c286027bcb18fceda56.1497394243.git.digetx@gmail.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8c0a2417584ce51b716f2c286027bcb18fceda56.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 14, 2017 at 1:15 AM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The commands stream is prepended by the jobs class on the CDMA submission,
> so that explicitly setting a module class in the commands stream isn't
> necessary. The firewall initializes its class to 0 and the command stream
> that doesn't explicitly specify the class effectively bypasses the firewall.
>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
