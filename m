From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ALSA: hda: Use standard waitqueue for RIRB
 wakeup
Date: Wed, 18 Dec 2019 14:17:27 +0000
Message-ID: <53562c71-4d81-1580-f311-971ceb029431@nvidia.com>
References: <20191210145727.22054-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191210145727.22054-1-tiwai@suse.de>
Content-Language: en-US
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 10/12/2019 14:57, Takashi Iwai wrote:
> The HD-audio CORB/RIRB communication was programmed in a way that was
> documented in the reference in decades ago, which is essentially a
> polling in the waiter side.  It's working fine but costs CPU cycles on
> some platforms that support only slow communications.  Also, for some
> platforms that had unreliable communications, we put longer wait time
> (2 ms), which accumulate quite long time if you execute many verbs in
> a shot (e.g. at the initialization or resume phase).
> 
> This patch attempts to improve the situation by introducing the
> standard waitqueue in the RIRB waiter side instead of polling.  The
> test results on my machine show significant improvements.  The time
> spent for "cat /proc/asound/card*/codec#*" were changed like:
> 
> * Intel SKL + Realtek codec
>   before the patch:
>    0.00user 0.04system 0:00.10elapsed 40.0%CPU
>   after the patch:
>    0.00user 0.01system 0:00.10elapsed 10.0%CPU
> 
> * Nvidia GP107GL + Nvidia HDMI codec
>   before the patch:
>    0.00user 0.00system 0:02.76elapsed 0.0%CPU
>   after the patch:
>    0.00user 0.00system 0:00.01elapsed 17.0%CPU
> 
> So, for Intel chips, the total time is same, while the total time is
> greatly reduced (from 2.76 to 0.01s) for Nvidia chips.
> The only negative data here is the increase of CPU time for Nvidia,
> but this is the unavoidable cost for faster wakeups, supposedly.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Starting with next-20191217 I am seeing the following error on one of
our Tegra platforms ...

tegra-hda 3510000.hda: azx_get_response timeout, switching to polling
mode: last cmd=0x404f2d00

Bisect is point to this commit and although it does not cleanly revert,
if I revert this and a couple dependencies on top of -next the issue
goes away. Any thoughts on what could be going on here?

Cheers
Jon

-- 
nvpublic
