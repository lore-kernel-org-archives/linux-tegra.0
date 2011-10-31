From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH 2/3] staging: nvec: add device tree support
Date: Mon, 31 Oct 2011 23:18:19 +0100
Message-ID: <2575094.nz9Q3TTkgX@ax5200p>
References: <cover.1320088857.git.marvin24@gmx.de>
	<04ffd9770698b7efb119b92fa379eb2e2698e223.1320088857.git.marvin24@gmx.de>
	<74CDBE0F657A3D45AFBB94109FB122FF173EDAB877@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173EDAB877@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Julian Andres Klode <jak@jak-linux.org>, Greg KH <gregkh@suse.de>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 31 October 2011 13:18:13 Stephen Warren wrote:
> Marc Dietrich wrote at Monday, October 31, 2011 1:59 PM:
> > This adds device tree support to the nvec driver. By using this method
> > it is no longer necessary to specify platform data through a board
> > file.
> 
> ...
> 
> > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> 
> ...
> 
> > +	if (pdata) {
> > +		nvec->gpio = pdata->gpio;
> > +		nvec->i2c_addr = pdata->i2c_addr;
> > +	} else if (nvec->dev->of_node) {
> > +		nvec->gpio = of_get_named_gpio(nvec->dev->of_node, "request-gpios",
> > 0); +		if (nvec->gpio < 0) {
> > +			dev_err(&pdev->dev, "no gpio specified");
> > +			goto failed;
> > +		}
> > 
> > +		prop = of_get_property(nvec->dev->of_node, "slave-addr", NULL);
> > +		if (!prop) {
> > +			dev_err(&pdev->dev, "no i2c address specified");
> > +			goto failed;
> > +		}
> > +		nvec->i2c_addr = be32_to_cpup(prop);
> 
> ----------==========----------==========----------==========----------======
> ==== Don't you want to use of_property_read_u32() here to simplify the code
> slightly? You can also get rid of at least one #include that way.

Ok, I somehow didn't found it during my quick search.

> > +	} else {
> > +		dev_err(&pdev->dev, "no platform data\n");
> > +		goto failed;
> > +	}
