From: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] pinctrl: Cleanup string initializations (char[] instead of char *)
Date: Sat, 17 May 2014 15:36:40 +0000 (UTC)
Message-ID: <loom.20140517T173525-130@post.gmane.org>
References: <1400337445-25750-1-git-send-email-manuel.schoelling@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Manuel Sch=C3=B6lling <manuel.schoelling@...> writes:

>=20
> Initializations like 'char *foo =3D "bar"' will create two variables:=
 a=20
static
> string and a pointer (foo) to that static string. Instead 'char foo[]=
 =3D=20
"bar"'
> will declare a single variable and will end up in shorter
> assembly (according to Jeff Garzik on the KernelJanitor's TODO list).
>=20

=46or globals this might be the case, but for function locals this is
actually more code since the string now needs to be copied to the stack=
=2E
