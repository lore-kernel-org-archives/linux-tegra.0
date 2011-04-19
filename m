From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH 4/5] ASoC: Process card->widgets after all
	probe routines
Date: Tue, 19 Apr 2011 12:19:37 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04973BB49A@HQMAIL01.nvidia.com>
References: <1303238777-14277-1-git-send-email-swarren@nvidia.com>
	<1303238777-14277-4-git-send-email-swarren@nvidia.com>
	<20110419185238.GL1765@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20110419185238.GL1765@opensource.wolfsonmicro.com>
Content-Language: en-US
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "mike@compulab.co.il" <mike@compulab.co.il>, "lrg@slimlogic.co.uk" <lrg@slimlogic.co.uk>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Tuesday, April 19, 2011 12:53 PM:
> On Tue, Apr 19, 2011 at 12:46:16PM -0600, Stephen Warren wrote:
> 
> > Without this, if tegra_wm8903 is modified to provide controls,
> > widgets, and routes through data rather than calling registration
> > functions, tegra_wm8903_event_* will crash, because w->codec==NULL.
> 
> This will break other things as it means that we can't route to the DAPM
> widgets that are added from machine init functions (eg, those that set
> up jacks) which is a more common case - see the changelog for the code
> you're modifying.
> 
> There's also the fact that these widgets should be being created in the
> card DAPM context so I'm a bit concerned that they're getting a CODEC at
> all.  The dereferencing you're trying to do isn't good, you're looking
> for a CODEC to find the card for widgets in the card DAPM context which
> shouldn't be associated with any particular CODEC in the first place.
> You should just find the card based on the DAPM context you're in.

OK. I dropped that patch and fixed up the event functions so they work
correctly.

However, I do notice one other regression moving the tegra_wm8903 driver
to data instead of code for widgets/controls/routes:

Before that change, the "Int Spk" control both works fine, and when I
modify the value in alsamixer, exit, and restart alsamixer, the value I
set is maintained.

However, after that change, the control works fine (i.e. mutes/umutes
speakers while speaker-test is running in the background), but when I
quit and restart alsamixer, the most recent set value is not shown.

Do you have any clue what I should look at for that?

Thanks!

-- 
nvpublic
