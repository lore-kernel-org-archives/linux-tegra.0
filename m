From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [RFC PATCH v2 1/5] notify channel errors to userspace
Date: Thu, 3 Sep 2015 18:01:11 +0900
Message-ID: <CAAVeFuKcZcw9xv2ak0K3b_pAkoN0+dpwDyK12qmyW9o6fEO5mg@mail.gmail.com>
References: <1441021115-28537-1-git-send-email-kholtta@nvidia.com> <1441021115-28537-2-git-send-email-kholtta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441021115-28537-2-git-send-email-kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?S29uc3RhIEjDtmx0dMOk?= <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 31, 2015 at 8:38 PM, Konsta H=C3=B6ltt=C3=A4 <kholtta@nvidi=
a.com> wrote:
> Let userspace know about some specific types of errors via a shared
> buffer registered with a new ioctl, NOUVEAU_GEM_SET_ERROR_NOTIFIER.
> Once set, the notifier buffer is used until the channel is destroyed.
> The exceptional per-channel error conditions are signaled upwards fro=
m
> the nvkm layer via the event/notify mechanism and written to the buff=
er
> which holds the latest error occurred, readable from userspace.
>
> Some error situations render a channel completely stuck, which may
> require even discarding and reinitializing it or the gpu completely.
> Once a specific type of error happens, no others are expected until
> recovery. Passing the error to userspace in a shared buffer enables t=
he
> graphics driver to periodically check in a light-weight way if anythi=
ng
> went wrong (typically, after a submit); e.g., the GL robustness
> extension requires to detect that the context has dead.
>
> The notifier currently signals idle timeout, sw notify, mmu fault and
> illegal pbdma error conditions.

Hi Konsta,

Before this series can be considered for upstream, I suppose it will
need to be ported to the latest codebase.

This will likely require a rewrite due to the heavy changes that
occured, but hopefully it will also allow you to address some of the
hacks more cleanly.
