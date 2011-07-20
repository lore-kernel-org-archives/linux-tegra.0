From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3 v2] dt: tegra20: Add ehci host controller nodes.
Date: Wed, 20 Jul 2011 14:03:42 -0600
Message-ID: <CACxGe6tGt43MvM8hqYQX=N9BtjffqZLfMOYZNKGOhgZbv1g6gw@mail.gmail.com>
References: <1311190690-18334-1-git-send-email-achew@nvidia.com>
	<1311190690-18334-2-git-send-email-achew@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF049EBDEF50@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049EBDEF50-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 20, 2011 at 1:52 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote at Wednesday, July 20, 2011 1:38 PM:
>> These values were derived from various headers in arch/arm/mach-tegra.
>>
>> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Patches 2 and 3:
>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> I know Olof had suggested splitting the phy properties into a sub-node
> of the EHCI controller. I'll let you and him discuss that; I don't
> really have an opinion on that.

My comments on the property names will need to be resolved.

g.
