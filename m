From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: core: add regulator_get_linear_step()
Date: Fri, 7 Jun 2013 10:03:22 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1306071000330.32163@utopia.booyaka.com>
References: <alpine.DEB.2.02.1306070753420.32163@utopia.booyaka.com> <20130607090923.GH31367@sirena.org.uk> <alpine.DEB.2.02.1306070920010.32163@utopia.booyaka.com> <20130607095936.GK31367@sirena.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130607095936.GK31367-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

On Fri, 7 Jun 2013, Mark Brown wrote:

> On Fri, Jun 07, 2013 at 09:38:10AM +0000, Paul Walmsley wrote:
> 
> > +static int get_cvb_voltage(struct platform_device *pdev, int c0, int c1,
> > +			   int c2)
> > +{
> > +	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
> > +	/* apply only speedo scale: output mv = cvb_mv * v_scale */
> > +	int mv;
> > +
> > +	/* combined: apply voltage scale and round to cvb alignment step */
> > +	mv = DIV_ROUND_CLOSEST(c2 * td->speedo_value, td->cvb_speedo_scale);
> > +	mv = DIV_ROUND_CLOSEST((mv + c1) * td->speedo_value,
> > +			       td->cvb_speedo_scale) + c0;
> > +
> > +	/* XXX Bring back cvb_alignment_uv; put it in the board dfll DT */
> > +	return DIV_ROUND_UP(mv * 1000,
> > +			    td->cvb_voltage_scale * td->vdd_step) *
> > +		td->vdd_step / 1000;
> > +}
> 
> Hrm, right.  So I guess for this the question is why you need the steps
> at all - can't the driver just ask for the voltage it wants with
> whatever tolerance is appropriate (or just specify the maximum tolerable
> voltage if that's better)?  I'm not sure what cvb_voltage_scale is.
> 
> I guess the problem here is that you have to hit some fairly tight
> tolerances on the voltage?

The IP block has an I2C controller embedded in it that autonomously sends 
set-voltage commands (across a range of voltages) to the PMIC.  To enable 
that, the driver must first initialize the IP block with a 
voltage-to-selector table.


- Paul
