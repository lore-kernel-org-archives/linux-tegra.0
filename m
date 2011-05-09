From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: SDHCI enumeration order, dynamic mmcblkN IDs, and devicetree
Date: Mon, 9 May 2011 13:40:31 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986A9DBE@HQMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B0B3@HQMAIL01.nvidia.com>
	<20110430074032.GD3103@ponder.secretlab.ca>
	<74CDBE0F657A3D45AFBB94109FB122FF0497F1B156@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B156-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Monday, May 02, 2011 10:55 AM:
> Grant Likely wrote at Saturday, April 30, 2011 1:41 AM:
> > On Fri, Apr 29, 2011 at 09:34:37PM -0700, Stephen Warren wrote:
> > > The SDHCI driver assigns dynamic device numbers (mmcblk0/1/...) to
> > > devices based on when they get probed, which IDs are free at that time,
> > > etc. Many boards have e.g. 1 fixed MMC soldered onto the board, and 1
> > > SD slot. There may or may not be a card in the SD slot at probe time,
> > > which can then cause the numbering of the fixed MMC to differ.
> > >
> > > Developers (even boot scripts) want to create simple hard-coded command-
> > > lines based on static device IDs, e.g. root=/dev/mmcblk1p3.
> > >
> > > To reconcile these two somewhat conflicting requirements, the order in
> > > which the SDHCI controllers are passed to platform_add_devices has been
> > > varied, so that all soldered-down storage is registered first (which
> > > synchronously probes the device and assigns the block device ID, which
> > > is therefore pseudo-static), followed by socketed storage, which then
> > > get a dynamic ID. When there is only 1 socketed controller, this dynamic
> > > ID ends up being pseudo-static too.
> > >
> > > The Tegra board files have been doing this for a little while, and the
> > > changes to do so were inspired by similar changes to some (IIRC) OMAP
> > > board files.
> > >
> > > Now to the devicetree specific issue:
> > >
> > > In the model where the board file registers all the platform devices,
> > > which then get matched to OF DT nodes, there is only a single board file,
> > > and hence only a single order of registration of SDHCI controllers. The
> > > order required to achieve pseudo-static numbering may not be the same
> > > for all boards; it depends on which SDHCI controllers are used for which
> > > purpose. Hence, this workaround essentially doesn't always work anymore.
> > >
> > > Is there a way in DT to influence the platform device probe order? If not,
> > > should there be? Or, are there other ways to work around this? (root=UUID
> > > would work, but it's a pain for me to type and set up if I'm constantly
> > > rebuilding filesystem images)
> > >
> > > Thanks for any hints!
> >
> > Anytime you need to assign global or user visible names, the best way
> > to do it is to create properties in the /aliases node in the form:
> >
> > aliases {
> > 	mmc0 = &first-sdhci-label;
> > 	mmc1 = &second-
> > };
> >
> > Then the driver has a canonical place to look to determine whether or
> > not a name has already been assigned to a device; regardless of
> > whether or not the device is registered yet.
> 
> I believe that's simply going to define names for the SDHCI controllers
> themselves (or allow the controllers to define their own names).

Grant, sorry if I missed it, but I didn't see any reponse to this; does
devicetree provide a mechanism to alter the actual device enumeration
order? As I mentioned, I assume the aliases node has no effect on that.

Thanks.

> The issue is that the SDHCI block device names and SDHCI controller
> names are in a different name-space; using the aliases node to define
> the desired names for the controllers isn't going to affect the names
> of the block devices that the controllers expose.
> 
> That is, unless having an aliases node itself alters the probe order for
> the SDHCI controllers, but I doubt that's the case?
> 
> > There isn't much in the way of support code for parsing the aliases
> > node yet, but that is definitely the approach I would take.  You'll
> > also need to make sure the implemented solution is applicable across
> > all mmc controller drivers; not just tegra specific.  The details are
> > probably fiddly to work out.
> 
> I think any solution for Tegra would be generally applicable; it'd be
> implemented for the "sdhc-pltfm" device, which is shared between Tegra
> and a variety of other SoCs, and the mechanism (DT nodes, the way they
> are handled by the SDHCI drivers) should be portable to any other
> SDHCI driver as needed.
 
-- 
nvpublic
