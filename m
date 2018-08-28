From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: core: Don't schedule DAPM work if
 already in target state
Date: Tue, 28 Aug 2018 11:39:11 +0100
Message-ID: <20180828103911.GX32322@imbe.wolfsonmicro.main>
References: <1534520143-29266-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1534520143-29266-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 17, 2018 at 04:35:43PM +0100, Jon Hunter wrote:
> When dapm_power_widgets() is called, the dapm_pre_sequence_async() and
> dapm_post_sequence_async() functions are scheduled for all DAPM contexts
> (apart from the card DAPM context) regardless of whether the DAPM
> context is already in the desired state. The overhead of this is not
> insignificant and the more DAPM contexts there are the more overhead
> there is.
> 
> For example, on the Tegra124 Jetson TK1, when profiling the time taken
> to execute the dapm_power_widgets() the following times were observed.
> 
>   Times for function dapm_power_widgets() are (us):
>      Min 23, Ave 190, Max 434, Count 39
> 
> Here 'Count' is the number of times that dapm_power_widgets() has been
> called. Please note that the above time were measured using ktime_get()
> to log the time on entry and exit from dapm_power_widgets(). So it
> should be noted that these times may not be purely the time take to
> execute this function if it is preempted. However, after applying this
> patch and measuring the time taken to execute dapm_power_widgets() again
> a significant improvement is seen as shown below.
> 
>   Times for function dapm_power_widgets() are (us):
>      Min 4, Ave 16, Max 82, Count 39
> 
> Therefore, optimise the dapm_power_widgets() function by only scheduling
> the dapm_pre/post_sequence_async() work if the DAPM context is not in
> the desired state.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Looks ok to me:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Although that said the performance increase is pretty hard to
measure on my systems.

Thanks,
Charles
