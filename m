From: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/3 v2] usb: tegra20-ehci: Add devicetree support.
Date: Wed, 20 Jul 2011 15:57:03 -0700
Message-ID: <643E69AA4436674C8F39DCC2C05F76383CF0DD227D@HQMAIL03.nvidia.com>
References: <1311190690-18334-1-git-send-email-achew@nvidia.com>
	<CACxGe6uDVdemjbjY_i-_M_-VT8HuLdtXP-R9V8kB+pSSin4dEw@mail.gmail.com>
	<643E69AA4436674C8F39DCC2C05F76383CF0DD2279@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F76383CF0DD2279-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "'linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "'linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org'" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> > > +Required properties for type =3D "utmi". =A0These values are =

> > derived from
> > > +characterization by system engineering.
> > > + - hssync_start_delay
> > > + - idle_wait_delay
> > > + - elastic_limit
> > > + - term_range_adj
> > > + - xcvr_setup
> > > + - xcvr_lsfslew
> > > + - xcvr_lsrslew
> > =

> > All of these custom properties should be prefixed with "nvidia," to
> > avoid namespace collisions.
> =

> Are you saying we should prefix with "nvidia," on ALL of the =

> properties I've defined for the tegra20-ehci node?  Or =

> specifically those seven that you pointed out?  Because I =

> don't see a difference in terms of "custom"-ality between =

> say, hssync-start-delay, and the other stuff like phy-type, =

> mode, power-down-on-bus-suspend, and the reset-gpio and clk =

> from phy-type=3Dulpi...unless we're considering stuff like =

> phy-type to be a standard USB host controller node property.

Looking around for precedence, I see that fsl-usb.txt documents a phy-type =
as well as a dr-mode (though there's still underscores in that document...I=
 assume they will be replaced by hyphens at some point).  So I think the te=
gra2 ehci host driver will mirror that, and use those property names, in wh=
ich case I assume we don't have a vendor prefix on those.  Are "standard" u=
sb host controller properties (those that shouldn't have a vendor prefix) d=
ocumented anywhere?
