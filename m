From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/4] ARM: tegra: add pinmux controller to tegra124.dtsi
Date: Thu, 05 Dec 2013 16:19:47 -0700
Message-ID: <52A10A13.2020608@wwwdotorg.org>
References: <1386241070-4350-1-git-send-email-ldewangan@nvidia.com> <1386241070-4350-3-git-send-email-ldewangan@nvidia.com> <52A10932.1040903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <52A10932.1040903@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, thierry.reding@gmail.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 12/05/2013 04:16 PM, Stephen Warren wrote:
> On 12/05/2013 03:57 AM, Laxman Dewangan wrote:
>> The tegra124 pinmux controller is identical to tegra114 with
>> removing some of existing pins from T114 and adding new pins.
> 
> I already sent this patch.

Oh, I do notice one difference between the two patches:

Mine:

> +		reg = <0x70000868 0x148>,	/* Pad control registers */
> +		      <0x70003000 0x40c>;	/* Mux registers */

Yours:

> +		reg = <0x70000868 0x164		/* Pad control registers */
> +		       0x70003000 0x434>;	/* PinMux registers */

Are the increase register lengths in your patch correct? If so, I guess
I'll drop my patch and replace it with yours if you fix up the unit address.
