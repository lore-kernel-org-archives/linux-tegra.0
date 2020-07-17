From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RESEND RESEND PATCH] arm/arm64: defconfig: Update configs to use
 the new CROS_EC options
Date: Fri, 17 Jul 2020 08:59:35 +0200
Message-ID: <CAK8P3a0ScHe+ErEZr-x4Sj=3Yz7cppKDcemXemvwXMbPh-RVMQ@mail.gmail.com>
References: <20200305111047.147355-1-enric.balletbo@collabora.com> <CAFqH_52LhfV9AsnPRZi_ZPsgYX8WrUrKEsV-E7VHOw3ZZtHd-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFqH_52LhfV9AsnPRZi_ZPsgYX8WrUrKEsV-E7VHOw3ZZtHd-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Collabora Kernel ML <kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Miquel Raynal <miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leonard Crestez <leonard.crestez-3arQi8VN3Tc@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>D
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 15, 2020 at 11:31 PM Enric Balletbo Serra
<eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Missatge de Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> del
> dia dj., 5 de març 2020 a les 12:11:
> >
> > We refactored the CrOS EC drivers moving part of the code from the MFD
> > subsystem to the platform chrome subsystem. During this change we needed
> > to rename some config options, so, update the defconfigs accordingly.
> >
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > Acked-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Reviewed-by: Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Tested-by: Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
>
> A gentle ping. I'd like to land this if is possible because that way I
> can remove some legacy code in platform/chrome subsystem.
>
> Thanks,
>   Enric
>
> > Dear all,
> >
> > This is a resend of a resend patch [3]. In some previous discussions
> > maintainers would prefer to have this merged through the arm-soc tree
> > but wasn't merged yet and I forget to ping again, hence, sending a new
> > resend.

I've merged it into the arm/defconfig branch of the soc tree now.
If you have future platform specific changes to the defconfig files,
please just add soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org to the recipients to get the patch
into patchwork.

     Arnd
