From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 2/2] tegrarcm: License update for miniloader files
Date: Tue, 18 Jun 2013 10:16:02 +0200
Message-ID: <1776041.U5e6rSj2K9@fb07-iapwap2.physik.uni-giessen.de>
References: <1371525937-2713-1-git-send-email-amartin@nvidia.com> <1371525937-2713-2-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371525937-2713-2-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Allen,

I just want to make my comments public, which I already explained to Er=
ic=20
Brower from NVIDIA. In general, the L4T license is a bit better than th=
e=20
original one, but doesn't really apply to the *miniloader.h files. The =
problem=20
is that the *miniloader.h are not installed on any operting system=20
(Linux/FreeBSD), but are instead loaded into the SoC. Even if we assume=
 they=20
are installed (or better a copy is placed) on some "Personal Computer",=
 they=20
cannot be executed there. Detailed comments below.

Am Montag, 17. Juni 2013, 20:25:37 schrieb Allen Martin:
> This changes the license under which the miniloader files are
> distributed to the same license used for the binary portions of the
> Tegra L4T distribution.  This should hopefully make the license more
> palatable to distributions.
>=20
> Also changed the description to say that the license applies to all
> files in the miniloader directory instead of individually listing the
> files.  This should hopefully prevent it from becoming stale.
>=20
> Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  LICENSE | 284
> ++++++++++++++++++++++++++-------------------------------------- 1 fi=
le
> changed, 114 insertions(+), 170 deletions(-)
>=20
> diff --git a/LICENSE b/LICENSE
> index e126375..4bd5c60 100644
> --- a/LICENSE
> +++ b/LICENSE
> @@ -26,189 +26,133 @@
>  # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAG=
E.
>=20
>=20
> -The files tegra20-miniloader.h and tegra30-miniloader.h are provided
> -pursuant to the following license agreement:
> +The files in the miniloader directory are provided pursuant to the
> +following license agreement:
>=20
> -License For Use of NVIDIA Software
> +           License For Customer Use of NVIDIA Software
>=20
>=20
> -IMPORTANT NOTICE -- READ CAREFULLY: This License For Use of NVIDIA
> -Software ("LICENSE") is the agreement which governs use of the
> -software (in binary code form only) of NVIDIA Corporation and its
> -subsidiaries ("NVIDIA")
> -provided herewith by NVIDIA, including computer software and
> -associated printed materials (collectively, the "SOFTWARE").  By
> -downloading, installing, copying, or otherwise using the SOFTWARE, y=
ou
> -agree to be bound by the terms of this LICENSE.  If you do not agree
> -to the terms of this LICENSE, do not download, install or use the
> -SOFTWARE.
> +IMPORTANT NOTICE -- READ CAREFULLY: This License For Customer Use of
> +NVIDIA Software ("LICENSE") is the agreement which governs use of
> +the software of NVIDIA Corporation and its subsidiaries ("NVIDIA")
> +downloadable herefrom, including computer software and associated
> +printed materials ("SOFTWARE").  By downloading, installing, copying=
,
> +or otherwise using the SOFTWARE, you agree to be bound by the terms
> +of this LICENSE.  If you do not agree to the terms of this LICENSE,
> +do not download the SOFTWARE.
>=20
>  RECITALS
>=20
> -The SOFTWARE is protected by copyright laws and international
> -copyright treaties, as well as other intellectual property laws and
> -treaties. The SOFTWARE is not sold, and instead is only licensed for
> -use, strictly in accordance with this document.  This agreement sets
> -forth the terms and conditions of the SOFTWARE LICENSE only.
> +Use of NVIDIA's products requires three elements: the SOFTWARE, the
> +hardware on a graphics controller board, and a personal computer. Th=
e

While tegra has some GPU, I don't think this is required. Also a "perso=
nal=20
computer" also isn't required. I can upload the miniloaders from any em=
bedded=20
board.

> +SOFTWARE is protected by copyright laws and international copyright
> +treaties, as well as other intellectual property laws and treaties.
> +The SOFTWARE is not sold, and instead is only licensed for use,
> +strictly in accordance with this document.  The hardware is protecte=
d
> +by various patents, and is sold, but this agreement does not cover
> +that sale, since it may not necessarily be sold as a package with
> +the SOFTWARE.  This agreement sets forth the terms and conditions
> +of the SOFTWARE LICENSE only.
>=20
>  1.  DEFINITIONS
>=20
> -1.1  =E2=80=9CLicensee,=E2=80=9D =E2=80=9CYou=E2=80=9D and/or =E2=80=
=9CYour=E2=80=9D shall mean, collectively and
> -individually, Original Equipment Manufacturers, Independent Hardware
> -Vendors, Independent Software Vendors, and/or End-Users of the
> -Software pursuant to the terms and conditions of this LICENSE.
> -
> -1.2	 Intellectual Property Rights=E2=80=9D shall mean all proprietar=
y
> -rights, including all patents, trademarks, copyrights, know-how, tra=
de
> -secrets, mask works, including all applications and registrations
> -thereto, and any other similar protected rights in any country
> +1.1  Customer.  Customer means the entity or individual that
> +downloads the SOFTWARE.
>=20
>  2.  GRANT OF LICENSE
>=20
> -2.1  Rights and Limitations of Grant.  NVIDIA hereby grants to You t=
he
> -following non-exclusive, non-transferable, revocable right under
> -NVIDIA=E2=80=99s copyrights to use, copy, distribute and sublicense =
the
> -SOFTWARE (solely in binary code form) to Your sublicensees (a) solel=
y
> -for use in connection with NVIDIA hardware or software products; and
> -(b) pursuant to the terms and conditions of any form of end-user
> -software license agreement; provided, that Your sublicensees agree t=
o
> -be bound by this LICENSE or terms and conditions that are as
> -protective of NVIDIA=E2=80=99s Intellectual Property Rights in the S=
OFTWARE as
> -this LICENSE
> -
> -2.2  Limitations. You may not reverse engineer, decompile, or
> -disassemble the SOFTWARE, nor attempt in any other manner to obtain
> -the source code.
> -
> -Except as expressly permitted in this LICENSE, You shall not otherwi=
se
> -assign, sublicense, rent, lease, or in any other way transfer or
> -disclose SOFTWARE to any third party. Unless otherwise authorized in
> -the LICENSE, You shall not reverse- compile, disassemble,
> -reverse-engineer, or in any manner attempt to derive the source code
> -of the SOFTWARE.
> -
> -Except as expressly stated in this LICENSE, no license or right is
> -granted to You directly or by implication, inducement, estoppel or
> -otherwise. NVIDIA shall have the right to inspect or have an
> -independent auditor inspect Your relevant records to verify Your
> -compliance with the terms and conditions of this LICENSE.
> -
> -3.  TERM AND TERMINATION
> -
> -This LICENSE and the licenses granted hereunder shall be effective a=
s
> -of the date You download the applicable SOFTWARE (=E2=80=9CEffective=
 Date=E2=80=9D)
> -and continue for a period of one (1) year (=E2=80=9CInitial Term=E2=80=
=9D)
> -respectively, unless terminated earlier in accordance with the
> -=E2=80=9CTermination=E2=80=9D provision of this LICENSE.  Unless eit=
her party notifies
> -the other party of its intent to terminate this LICENSE at least thr=
ee
> -(3) months prior to the end of the Initial Term or the applicable
> -renewal period, this License will be automatically renewed for one (=
1)
> -year renewal periods thereafter, unless terminated in accordance wit=
h
> -the =E2=80=9CTermination=E2=80=9D provision of this LICENSE
> -
> -NVIDIA may terminate this LICENSE at any time if You violate its
> -terms. Upon termination, You will immediately destroy the SOFTWARE o=
r
> -return all copies of the SOFTWARE to NVIDIA, and certify to NVIDIA i=
n
> -writing that such actions have been completed.  Upon termination or
> -expiration of this LICENSE the license grants to Licensee shall
> -terminate, except that sublicenses rightfully granted by Licensee
> -under this LICENSE in connection with Paragraph 2 of this LICENSE
> -provided by Licensee prior to the termination or expiration of this
> -LICENSE shall survive in accordance with their respective form of
> -license terms and conditions.
> -
> -Those provisions in this LICENSE, which by their nature need to
> -survive the termination or expiration of this LICENSE, shall survive
> -termination or expiration of the LICENSE, including but not limited =
to
> -Paragraphs 1, 2.2, 3, 4, 5, 6, 7, and 8.
> -
> -If You commence or participate in any legal proceeding against NVIDI=
A,
> -including Intellectual Property Rights infringement claims against
> -NVIDIA, then NVIDIA may, in its sole discretion, suspend or terminat=
e
> -all license grants and any other rights provided under this LICENSE
> -during the pendency of such legal proceedings.
> -
> -4.  OWNERSHIP OF SOFTWARE AND INTELLECTUAL PROPERTY RIGHTS
> -
> -All rights, title and interest to all copies of the SOFTWARE remain
> -with NVIDIA, subsidiaries, licensors, or its suppliers. The SOFTWARE
> -is copyrighted and protected by the laws of the United States and
> -other countries, and international treaty provisions. You may not
> -remove any copyright notices from the SOFTWARE. NVIDIA may make
> -changes to the SOFTWARE, or to items referenced therein, at any time
> -and without notice, but is not obligated to support or update the
> -SOFTWARE. Except as otherwise expressly provided, NVIDIA grants no
> -express or implied right under any NVIDIA patents, copyrights,
> -trademarks, or other Intellectual Property Rights.
> -
> -You have no obligation to give NVIDIA any suggestions, comments or
> -other feedback (=E2=80=9CFeedback=E2=80=9D) relating to the SOFTWARE=
=2E  However, NVIDIA
> -may use and include any Feedback that You voluntarily provide to
> -improve the SOFTWARE or other related NVIDIA technologies.
> -Accordingly, if You provide Feedback, You agree NVIDIA and its
> -licensees may freely use, reproduce, license, distribute, and
> -otherwise commercialize the Feedback in the SOFTWARE or other relate=
d
> -technologies without the payment of any royalties or fees.
> -
> +2.1  Rights and Limitations of Grant.  NVIDIA hereby grants Customer
> +the following non-exclusive, non-transferable right to use the
> +SOFTWARE, with the following limitations:
> +
> +2.1.1  Rights.  Customer may install and use one copy of the SOFTWAR=
E
> +on a single computer, and except for making one back-up copy of
> +the Software, may not otherwise copy the SOFTWARE.  This LICENSE
> +of SOFTWARE may not be shared or used concurrently on different
> +computers.

As Stephen mentioned already, this is a bit strict.

> +2.1.2  Linux/FreeBSD Exception.  Notwithstanding the foregoing terms
> +of Section 2.1.1, SOFTWARE designed exclusively for use on the Linux=
 or
> +FreeBSD operating systems, or other operating systems derived from t=
he
> +source code to these operating systems, may be copied and redistribu=
ted,
> +provided that the binary files thereof are not modified in any way
> +(except for unzipping of compressed files).

As said above, the software cannot be used on these operating systems. =
Beside=20
this, why limit it to Linux/FreeBSD? E.g. debian also supports GNU/Hurd=
 or=20
Solaris. What about Darwin (MacOS) or Windows? I know this comes from L=
4T=20
where the drivers can only be executed on this OSes, but again, this do=
esn't=20
apply to the *miniloader.h files. Also note that the rest of tegrarcm i=
s=20
licensed under MIT license and can be installed everywhere...


Marc
