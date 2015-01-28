From: Dylan Reid <dgreid@chromium.org>
Subject: Re: [PATCH v3 06/10] ASoC: tegra: Add a control for
	the headphone switch
Date: Wed, 28 Jan 2015 09:46:27 -0800
Message-ID: <CAEUnVG6tKmdTt455w8g9C2_+XXpKz5=TR7=V8Lo3uJ3DKrOvag@mail.gmail.com>
References: <1422442278-10405-1-git-send-email-tomeu.vizoso@collabora.com>
 <1422442278-10405-7-git-send-email-tomeu.vizoso@collabora.com>
 <20150128110230.GQ21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20150128110230.GQ21293@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Lars-Peter Clausen <lars@metafoo.de>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Warren <swarren@wwwdotorg.org>, Andrew Bresticker <abrestic@chromium.org>, Simon Glass <sjg@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 28, 2015 at 3:02 AM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Jan 28, 2015 at 11:51:04AM +0100, Tomeu Vizoso wrote:
>
>> To be used by userspace when the headphones jack is plugged in.
>
>>  static const struct snd_kcontrol_new tegra_max98090_controls[] = {
>> +     SOC_DAPM_PIN_SWITCH("Headphones"),
>>       SOC_DAPM_PIN_SWITCH("Speakers"),
>>  };
>
> Why is userspace doing this?  If this is supposed to be associated with
> the jack detection I'd expect us to be doing this in kernel.

This is only related to jack detection in that seeing a jack insert or
removal can cause userspace to set or unset it depending on the
current policy.
