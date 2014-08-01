From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH 5/5] platform: Make platform_bus device a platform device
Date: Fri, 01 Aug 2014 18:21:14 +0100
Message-ID: <1406913674.22529.45.camel@hornet>
References: <1406298233-27876-1-git-send-email-pawel.moll@arm.com>
	 <1406298233-27876-5-git-send-email-pawel.moll@arm.com>
	 <20140726201240.GB21870@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140726201240.GB21870@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "paul@pwsan.com" <paul@pwsan.com>, Arnd Bergmann <arnd@arndb.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, "arm@kernel.org" <arm@kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, 2014-07-26 at 21:12 +0100, Greg Kroah-Hartman wrote:
> On Fri, Jul 25, 2014 at 03:23:53PM +0100, Pawel Moll wrote:
> > ... describing the root of the device tree, so one can write
> > a platform driver initializing the platform.
>=20
> Wait, what do you mean by "one can write a platform driver initializi=
ng
> the platform"?  I don't understand your end goal here...

Bad wording, sorry. The goal is to have a platform driver (as in
platform bus) that will initialize my platform (as in: board, machine,
hardware). My platform (as in: the board) will be represented by the
root platform bus device (as in: the bus ;-) with compatible value
matching the one passed in the device tree's root.

The tree:

8<----------------------------
/ {
	compatible =3D "my,board";
}
8<----------------------------

The driver:

8<----------------------------
static struct of_device_id my_board_match[] =3D {
        { .compatible =3D "my,board", },
        {},
};

static struct platform_driver my_board_driver =3D {
        .driver =3D {
                .name =3D "my_board",
                .owner =3D THIS_MODULE,
                .of_match_table =3D of_match_ptr(my_board_match),
        },
        .probe =3D my_board_probe,
        .remove =3D my_board_remove,
};
module_platform_driver(my_board_driver);
8<----------------------------

I'll work on better commit message for the next spin.

Pawe=C5=82
