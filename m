From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [PATCH 2/4] ARM: dt: tegra20.dtsi: Add Memory Controller(MC) nodes
Date: Wed, 16 May 2012 09:51:07 +0300
Message-ID: <20120516095107.3510cb39d0f9cd2527e0bf1e@nvidia.com>
References: <1336635764-30597-1-git-send-email-hdoyu@nvidia.com>
 <1336635764-30597-2-git-send-email-hdoyu@nvidia.com>
 <CAOesGMiPvw72006zpSGLBNi-C12MTc_w2QmOPg6YTfXMW+ZSkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMiPvw72006zpSGLBNi-C12MTc_w2QmOPg6YTfXMW+ZSkQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Simon Glass <sjg@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Hi Olof,

On Wed, 16 May 2012 08:35:02 +0200
Olof Johansson <olof@lixom.net> wrote:

> Hi,
> =

> Tiny drive-by nit pick.
> =

> On Thu, May 10, 2012 at 12:42 AM, Hiroshi DOYU <hdoyu@nvidia.com> wrote:
> > Add Tegra MC(Memory Controller) nodes for tegra20.dtsi.
> >
> > Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
> > ---
> > =A0arch/arm/boot/dts/tegra20.dtsi | =A0 =A07 +++++++
> > =A01 files changed, 7 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20=
.dtsi
> > index 24129fb..548b42e 100644
> > --- a/arch/arm/boot/dts/tegra20.dtsi
> > +++ b/arch/arm/boot/dts/tegra20.dtsi
> > @@ -211,5 +211,12 @@
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-ahb";
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x6000c004 0x10c>; /* AHB Arbit=
ration + Gizmo Controller */
> > =A0 =A0 =A0 =A0};
> > +
> > + =A0 =A0 =A0 mc {
> =

> It's common to use a more plain english name here, so
> "memory-controller" would be a good name.

Agree. Seems to be common as below. Fix patches follows, which can be squas=
hed if possible.

$% grep memory-controller arch/arm/boot/dts/*
arch/arm/boot/dts/prima2-cb.dts:                        memory-controller@9=
0000000 {
arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts:    memory-controller@2b0a0000 {
arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts:    memory-controller@7ffd0000 {
arch/arm/boot/dts/vexpress-v2p-ca5s.dts:        memory-controller@2a150000 {
arch/arm/boot/dts/vexpress-v2p-ca5s.dts:        memory-controller@2a190000 {
arch/arm/boot/dts/vexpress-v2p-ca9.dts: memory-controller@100e0000 {
arch/arm/boot/dts/vexpress-v2p-ca9.dts: memory-controller@100e1000 {
