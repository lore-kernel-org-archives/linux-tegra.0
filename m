From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: Don't schedule DAPM work if
 already in target state
Date: Mon, 3 Sep 2018 15:45:36 +0100
Message-ID: <7cb856ee-c9e6-b54b-6d12-37bf4005e5c3@nvidia.com>
References: <1534520143-29266-1-git-send-email-jonathanh@nvidia.com>
 <20180828103911.GX32322@imbe.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828103911.GX32322@imbe.wolfsonmicro.main>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 28/08/18 11:39, Charles Keepax wrote:
> On Fri, Aug 17, 2018 at 04:35:43PM +0100, Jon Hunter wrote:
>> When dapm_power_widgets() is called, the dapm_pre_sequence_async() and
>> dapm_post_sequence_async() functions are scheduled for all DAPM contexts
>> (apart from the card DAPM context) regardless of whether the DAPM
>> context is already in the desired state. The overhead of this is not
>> insignificant and the more DAPM contexts there are the more overhead
>> there is.
>>
>> For example, on the Tegra124 Jetson TK1, when profiling the time taken
>> to execute the dapm_power_widgets() the following times were observed.
>>
>>   Times for function dapm_power_widgets() are (us):
>>      Min 23, Ave 190, Max 434, Count 39
>>
>> Here 'Count' is the number of times that dapm_power_widgets() has been
>> called. Please note that the above time were measured using ktime_get()
>> to log the time on entry and exit from dapm_power_widgets(). So it
>> should be noted that these times may not be purely the time take to
>> execute this function if it is preempted. However, after applying this
>> patch and measuring the time taken to execute dapm_power_widgets() again
>> a significant improvement is seen as shown below.
>>
>>   Times for function dapm_power_widgets() are (us):
>>      Min 4, Ave 16, Max 82, Count 39
>>
>> Therefore, optimise the dapm_power_widgets() function by only scheduling
>> the dapm_pre/post_sequence_async() work if the DAPM context is not in
>> the desired state.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
> 
> Looks ok to me:
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Although that said the performance increase is pretty hard to
> measure on my systems.

If you can enable the function graph tracer, then you should be again to
profile the dapm_power_widgets() function with it as it will give you a
time for how long the function took [0].

Cheers
Jon

[0] https://lwn.net/Articles/370423/

-- 
nvpublic
