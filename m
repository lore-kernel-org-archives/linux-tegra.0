From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 6/6] ASoC: Tegra: Harmony: Support both int
	and ext mics
Date: Thu, 3 Feb 2011 22:52:35 +0000
Message-ID: <20110203225235.GD4586@opensource.wolfsonmicro.com>
References: <1296766578-13988-1-git-send-email-swarren@nvidia.com>
	<1296766578-13988-6-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1296766578-13988-6-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@nvidia.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, lrg@slimlogic.co.uk
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 03, 2011 at 01:56:18PM -0700, Stephen Warren wrote:

> At present, I'm not sure how best to resolve this. Downstream drivers
> directly tweaked the wm8903's registers so that both ADCs processed the
> same input channel.

The CODEC driver needs to have support for routing the left and right
channels like things like the WM8993 do.

>  	{"IN1L", NULL, "Mic Jack"},
> +	{"IN1R", NULL, "Mic Jack"},

This looks odd - I'd expect to see separate widgets for the internal
microphone rather than using the same widget.  This would greatly
simplify the driver code without really impacting the level of
configuration applications need to do (and allowing them to use both
simultaneously if they want to).

> +static int harmony_set_mic_selection(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_card *card = codec->card;
> +	struct tegra_harmony *harmony = snd_soc_card_get_drvdata(card);
> +
> +	if (harmony->mic_selection == ucontrol->value.integer.value[0])
> +		return 0;
> +
> +	harmony->mic_selection = ucontrol->value.integer.value[0];
> +	harmony_mic_control(codec);

This should be locking the CODEC mutex while doing the update.

> +static const struct soc_enum harmony_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mic_selection_names),
> +			    mic_selection_names),
>  };

Don't create arrays of enums, declare individual varaibles and reference
them...

> +	SOC_ENUM_EXT("Mic Selection", harmony_enum[0],
> +		     harmony_get_mic_selection, harmony_set_mic_selection),

...as it makes the references to them much easier to follow and less
error prone.
