From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH] ASoC: tegra: Use flat regcache.
Date: Tue, 18 Mar 2014 11:39:30 +0100
Message-ID: <53282262.2030300@metafoo.de>
References: <1395115139-22243-1-git-send-email-dgreid@chromium.org>
 <s5hha6wdmxa.wl%tiwai@suse.de> <20140318102858.GE11706@sirena.org.uk>
 <s5h4n2vssnu.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <s5h4n2vssnu.wl%tiwai@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, swarren@wwwdotorg.org, abrestic@chromium.org, Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org, Dylan Reid <dgreid@chromium.org>
List-Id: linux-tegra@vger.kernel.org

On 03/18/2014 11:33 AM, Takashi Iwai wrote:
> At Tue, 18 Mar 2014 10:28:58 +0000,
> Mark Brown wrote:
>>
>> On Tue, Mar 18, 2014 at 07:46:09AM +0100, Takashi Iwai wrote:
>>
>>> kmemdup() with GFP_KERNEL in the lock context.  Ditto in
>>> regmap_register_patch(), which calls krealloc() with GFP_KERNEL.
>>
>> So send a patch...
>
> Yeah, yeah, don't rush :)
>
>>> The former could be fixed by moving the lock like below.  The fix for
>>> the latter depends on whether we need to protect map->patch_regs
>>> growth from races or not.  If not, krealloc() can be moved out of the
>>> lock.
>>
>> It should only be happening on init so probably not.  On the other hand
>> doing it without any sort of locking isn't great.
>
> Right.  OTOH, it's still better than papering over with GFP_ATOMIC, I
> think.  We can just give a proper note in the function description,
> for example.

We should still hold the log over the _regmap_write portion of 
regmap_register_patch(), but I think we should otherwise be fine if we make 
it a API requirement that the caller needs to make sure that 
regmap_register_patch() is not called concurrently to itself or to 
regcache_sync().

- Lars
