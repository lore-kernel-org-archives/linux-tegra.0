From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [Nouveau] [PATCH 0/3] drm/gk20a: support for reclocking
Date: Fri, 11 Jul 2014 10:38:49 +0900
Message-ID: <53BF4029.5060301@nvidia.com>
References: <1404977677-22248-1-git-send-email-acourbot@nvidia.com>
 <CACAvsv7cxHbXaF-0wi=cijACUBdrH_rqamM+=okrb0+cJxYAsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv7cxHbXaF-0wi=cijACUBdrH_rqamM+=okrb0+cJxYAsw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Ben,

On 07/11/2014 10:07 AM, Ben Skeggs wrote:
> On Thu, Jul 10, 2014 at 5:34 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>> This series adds support for reclocking on GK20A. The first two patches touch
>> the clock subsystem to allow GK20A to operate, by making the presence of the
>> thermal and voltage devices optional, and allowing pstates to be provided
>> directly instead of being probed using the BIOS (which Tegra does not have).
> Hey Alex,
>
> I mentioned a while back I had some stuff in-progress to make
> implementing this a bit cleaner for you, but as you can probably tell,
> I didn't get to it yet.  It's likely I won't manage to before the next
> merge window either.  So, I'll likely take these patches as-is
> (assuming no objections on reviews here) and rebase my stuff on top.

Thanks. You will probably notice that these patches won't apply to your 
tree and require some tweaking. I will probably end up sending a v2 
anyway, so maybe you should wait for it. If you want to try this version 
anyway, I have fixed-up patches against your tree.

Note that your tree currently won't build against -next because it uses 
drm_sysfs_connector_add/remove which are not available anymore (replaced 
by drm_connector_register/unregister I believe).

Oh and while I'm at it, there seems to be a typo in line 131 of clock.h, 
which should read _nouveau_clock_fini and not _nouveau_clock_init.

>>
>> The last patch adds the GK20A clock device. Arguably the clock can be seen as a
>> stripped-down version of what is seen on NVE0, however instead of using NVE0
>> support has been written from scratch using the ChromeOS kernel as a basis.
>> There are several reasons for this:
>>
>> - The ChromeOS driver uses a lookup table for the P coefficient which I could
>>    not find in the NVE0 driver,
> Interesting.  Can you give more details on how "PL" works exactly,
> we'd been operating on the assumption (mainly inherited from code that
> appeared in xf86-video-nv) that it was always a straight division.

The pl_to_div table in clock/gk20a.c should give the right coefficients, 
but I have seen contradictory information in our docs. Let me ask the 
right people so we can get to the bottom of this.

>
>> - Some registers that NVE0 expects to find are not present on GK20A (e.g.
>>    0x137120 and 0x137140),
>> - Calculation of MNP is done differently from what is performed in
>>    nva3_pll_calc(), and it might be interesting to compare the two methods,
>> - All the same, the programming sequence is done differently in the ChromeOS
>>    driver and NVE0 could possibly benefit from it (?)
>>
>> It would be interesting to try and merge both, but for now I prefer to have the
>> two coexisting to ensure proper operation on GK20A and besure I don't break
>> dGPU support. :)
> It's something we can look to achieving down the road, but won't block
> merging the support.

Great, thanks!

>
>>
>> Regarding the first patch, one might argue that I could as well add thermal
>> and voltage devices to GK20A. The reason this is not done is because these
>> currently depend heavily on the presence of a BIOS, and will require a rework
>> similar to that done in patch 2 for clocks. I would like to make sure this
>> approach is approved because applying it to other subdevs.
> They don't *need* to depend on the BIOS, you can opt for an
> implementation that doesn't use the base classes that the rest of the
> dGPU implementations do.  But, it's fine to take the approach you've
> taken.

At first I did not use the base classes for the gk20a clock 
implementation, but it resulted in replicating some init code and I was 
concerned that this might be a source of bugs in the future (e.g. clock 
base clock init gets updated but not the gk20a init). So I preferred the 
current approach which keeps everything in the same place.

Since you have no concern with it I will apply the same to volt and 
therm, and we can then get rid of patch 1. Then I should probably send 
you a v2 once the PL thing is cleared.

Cheers,
Alex.
