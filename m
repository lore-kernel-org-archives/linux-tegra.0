From: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
Date: Thu, 11 Jun 2020 09:17:51 +0100
Message-ID: <CAPj87rMcXQozYX90wGYbv_vNnQ0-fLLnEdH3Lzio+B1L7xZuYg@mail.gmail.com>
References: <20200610113059.2164132-1-thierry.reding@gmail.com> <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On Thu, 11 Jun 2020 at 08:54, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 10.06.2020 14:30, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> > have a zpos property") a warning is emitted if there's a mix of planes
> > with and without a zpos property.
>
> What problem does it solve?

Well, it fixes the WARN_ON, which asserts that either no planes have
the zpos property attached, or all planes have the zpos property
attached. When only _some_ planes have the property, the property is
pretty much useless: zpos exists to guarantee to userspace the
relative ordering between planes, defined by the value of the
property. If not all planes have the property, then userspace cannot
reason about the ordering, since some of the planes have undefined
ordering.

Cheers,
Daniel
