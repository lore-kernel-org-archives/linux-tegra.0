From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: Re: [PATCH] Revert part of "ASoC: tegra: Convert to
	managed resources"
Date: Tue, 18 Aug 2015 22:31:19 +0530
Message-ID: <CAK-LDbJh26b=ZQnD5Y4cYgzRdu=Zzi+quKU8-_FDk25pgoMCcw@mail.gmail.com>
References: <20150818115645.GA3345@localhost>
 <20150818165517.GL10748@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20150818165517.GL10748@sirena.org.uk>
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
Cc: Alexandre Courbot <gnurou@gmail.com>, alsa-devel@alsa-project.org, Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 18 Aug 2015 22:25, "Mark Brown" <broonie@kernel.org> wrote:
>
> On Tue, Aug 18, 2015 at 05:26:45PM +0530, Vaishali Thakkar wrote:
>
> > Revert the problematic part of commit 470805eb9f31 ("ASoC: tegra:
> > Convert to managed resources"). Before this commit, PM cleanup was
>
> Please use subject lines matching the style for the subsystem on
> patches.

Oh, I am sorry.

I'll keep this in mind for next time. Thanks for making it suitable and
applying the patch.
