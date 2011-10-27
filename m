From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 3/3] staging: nvec: add device tree support
Date: Thu, 27 Oct 2011 12:17:25 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173E1B498B@HQMAIL01.nvidia.com>
References: <cover.1319658296.git.marvin24@gmx.de>
 <48050ec08d248a2a10b4f5faf6cac6b214041ebe.1319658296.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48050ec08d248a2a10b4f5faf6cac6b214041ebe.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org" <devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Wednesday, October 26, 2011 1:59 PM:
> This adds device tree support to the nvec driver. By using this method
> it is no longer necessary to specify platform data through a board
> file.

You should document the binding in Documentation/devicetree/bindings.

> @@ -892,6 +915,17 @@ static int tegra_nvec_resume(struct platform_device *pdev)
>  #define tegra_nvec_resume NULL
>  #endif
> 
> +#if defined(CONFIG_OF)

I think you can just remove the ifdef and always include this code. Yes, it'll
result in slightly more rodata when !CONFIG_OF, but !CONFIG_OF isn't going to
exist or be useful for Tegra for that much longer.

> +/* Match table for of_platform binding */
> +static const struct of_device_id nvidia_nvec_of_match[] __devinitconst = {
> +	{ .compatible = "nvidia,nvec", },

I'm not sure that nvidia,nvec is the right value, but need a little more
background.

It's my understanding that how this works is a little micro-controller
exists on the board, handles various devices like the keyboard, and sends
data to Tegra by making I2C master transactions. Isn't it the case that
the micro-controller (or at least the SW running on it) is board-specific,
and the same for the I2C protocol? If so, nvidia,nvec is a little generic;
we probably need to name it compal,paz00-ec or something like that?

Either way, we should probably include some kind of version number in
the compatible property so we can support upgrades to the protocol if
needed.

-- 
nvpublic
