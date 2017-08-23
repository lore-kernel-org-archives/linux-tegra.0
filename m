From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ASoC: tegra: Remove superfluous 'machine' variable
Date: Wed, 23 Aug 2017 16:28:42 +0200
Message-ID: <CAK8P3a1qb+uQP3WaAPXesBcW9aXsq1Kif61xjJkykysay1r8VQ@mail.gmail.com>
References: <20170823134715.1088951-1-arnd@arndb.de> <20170823142138.ps65qu3ohvhrrubl@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170823142138.ps65qu3ohvhrrubl@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 23, 2017 at 4:21 PM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Aug 23, 2017 at 03:46:30PM +0200, Arnd Bergmann wrote:
>> The last cleanup left behind an unused variable:
>
> This doesn't apply against current code, please check and resend.

I built against today's linux-next, but you already applied the same fix this
morning after Stephen reported the problem.

     Arnd
