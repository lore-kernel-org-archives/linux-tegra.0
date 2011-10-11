From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: fix compilation error for linux 3.2
Date: Tue, 11 Oct 2011 10:28:23 +0200
Message-ID: <2109696.pnkA82QAhR@fb07-iapwap2>
References: <3546151.Ds9gZv0JqE@fb07-iapwap2> <CAOesGMgyYebNw1vphaKf8SPLBvtSvwPa0nCLxr81UJ-BtSRhzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgyYebNw1vphaKf8SPLBvtSvwPa0nCLxr81UJ-BtSRhzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Olof,

Am Montag, 10. Oktober 2011, 10:45:48 schrieb Olof Johansson:
> I can't reproduce this problem. CONFIG_SPI doesn't seem to be on for
> tegra_defconfig (I'll revisit the defconfig and turn on missing
> options for 3.2), but even after I enable it (plus CONFIG_SPI_TEGRA),
> I don't see any errors here. I tried static build as well as module.
> Can you provide more detail to what you're seeing?

ah, sorry, it is needed for linux-next (which also happens to have a 3.=
1-rc9=20
version). You can easily check if include/linux/device.h has module.h i=
ncluded or not=20
(if not, tegra-spi fails to compile). I updated the subject.

> Also, for future patches:
>=20
> * Please add your free-form comment below the "---" in the commit
> message. That way git apply-mbox will just automatically do the right
> thing and leave it out from the patch

ok, this wasn't obvious to me. I can send a new patch if needed.

> * If you include the compiler error output it's easier for others to
> find the error on the lists and avoid duplicate patch submissions.

here it goes:

  CC      drivers/spi/spi-tegra.o
drivers/spi/spi-tegra.c:597: error: expected declaration specifiers or =
=E2=80=98...=E2=80=99 before=20
string constant
drivers/spi/spi-tegra.c:597: warning: data definition has no type or st=
orage class
drivers/spi/spi-tegra.c:597: warning: type defaults to =E2=80=98int=E2=80=
=99 in declaration of=20
=E2=80=98MODULE_ALIAS=E2=80=99
drivers/spi/spi-tegra.c:597: warning: function declaration isn=E2=80=99=
t a prototype
drivers/spi/spi-tegra.c:604: warning: data definition has no type or st=
orage class
drivers/spi/spi-tegra.c:604: warning: type defaults to =E2=80=98int=E2=80=
=99 in declaration of=20
=E2=80=98MODULE_DEVICE_TABLE=E2=80=99
drivers/spi/spi-tegra.c:604: warning: parameter names (without types) i=
n function=20
declaration
drivers/spi/spi-tegra.c:612: error: =E2=80=98THIS_MODULE=E2=80=99 undec=
lared here (not in a function)
drivers/spi/spi-tegra.c:630: error: expected declaration specifiers or =
=E2=80=98...=E2=80=99 before=20
string constant
drivers/spi/spi-tegra.c:630: warning: data definition has no type or st=
orage class
drivers/spi/spi-tegra.c:630: warning: type defaults to =E2=80=98int=E2=80=
=99 in declaration of=20
=E2=80=98MODULE_LICENSE=E2=80=99
drivers/spi/spi-tegra.c:630: warning: function declaration isn=E2=80=99=
t a prototype
make[2]: [drivers/spi/spi-tegra.o] Error 1


	Marc


> On Mon, Oct 10, 2011 at 2:17 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrot=
e:
> > Hi Olof,
> >=20
> > sorry for being so late, but here is another last minute patch.
> >=20
> > Marc
> >=20
> > -----
> >=20
> > spi/tegra: fix compilation error in spi-tegra.c
> >=20
> > This adds the missing #include <linux/module.h> to spi-tegra.c
> >=20
> > Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> >=20
> > diff --git a/drivers/spi/spi-tegra.c b/drivers/spi/spi-tegra.c
> > index a5a6302..e8cd58f 100644
> > --- a/drivers/spi/spi-tegra.c
> > +++ b/drivers/spi/spi-tegra.c
> > @@ -18,6 +18,7 @@
> >  */
> >=20
> >  #include <linux/kernel.h>
> > +#include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/err.h>
> >  #include <linux/platform_device.h>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
