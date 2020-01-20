From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] mmc: tegra: fix SDR50 tuning override
Date: Mon, 20 Jan 2020 10:43:28 +0100
Message-ID: <CAPDyKFqmXiv75XCK6-tNJn5xTxyYpZcKRGKhvg-G0ycSZ_xw7g@mail.gmail.com>
References: <9aff1d859935e59edd81e4939e40d6c55e0b55f6.1578390388.git.mirq-linux@rere.qmqm.pl>
 <CAPDyKFqXmbnH_NWZZTHHCE+Lt-f3JHAhJ8-=aoKNEPyQed44YA@mail.gmail.com> <20200117141145.GD26135@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200117141145.GD26135-cHozx32mtrEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 17 Jan 2020 at 15:11, Micha=C5=82 Miros=C5=82aw <mirq-linux-wU0TDC5Ep/E@public.gmane.org=
qm.pl> wrote:
>
> On Thu, Jan 16, 2020 at 03:39:54PM +0100, Ulf Hansson wrote:
> > On Tue, 7 Jan 2020 at 10:47, Micha=C5=82 Miros=C5=82aw <mirq-linux@rere=
.qmqm.pl> wrote:
> > >
> > > Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
> > > broke SDR50 tuning override. Use correct NVQUIRK_ name.
> > >
> > > Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
> > > Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 4f6aa3264af4: mmc: tegra: Only adverti=
se UHS modes if IO regulator is present
> >
> > I am dropping this tag, simply because I don't understand what it shoul=
d tell.
>
> It tells the maintainer that he needs to cherry-pick this commit if
> its not in particular stable version already. I guess this is only
> for v4.4, as v4.9+ already have it, and v3.16 does not include the
> Fixed commit.

Alright, I updated myself on stable rules and found this, thanks!

So I have amended the patch to add back the tag, let's give this a try.

Kind regards
Uffe
