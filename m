From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] i2c: tegra: Fix compile when !CONFIG_OF
Date: Thu, 21 Jul 2011 08:42:06 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049EBDF141@HQMAIL01.nvidia.com>
References: <1310589418-15821-1-git-send-email-swarren@nvidia.com>
	<CACxGe6sVmpSTAxan3zRz-hQ=uoiVuekm-7r0L9_F5EWPPhS_3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6sVmpSTAxan3zRz-hQ=uoiVuekm-7r0L9_F5EWPPhS_3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Grant Likely wrote at Wednesday, July 13, 2011 4:48 PM:
> On Thu, Jul 14, 2011 at 5:36 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > When !CONFIG_OF, <linux/of.h> doesn't prototype of_get_property(), which
> > causes i2c-tegra.c to fail to compile. Make the references to this
> > function conditional to solve this.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
...
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Ben, please can this patch be applied in time for 3.1? Currently, the
linux-next and next-i2c tree won't compile on Tegra without CONFIG_OF
enabled.

Also, the other patch I posted titled "i2c: Tegra: Add of_match_table"
is required for Tegra I2C Device Tree support to be useful. Can that go
into 3.1 as well?

Thanks very much!

-- 
nvpublic
