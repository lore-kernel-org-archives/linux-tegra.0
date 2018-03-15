From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: plane: Correct legacy blending
Date: Thu, 15 Mar 2018 16:47:01 +0300
Message-ID: <5bb313f0-8d90-3cd6-5680-bb695d9b7e2a@gmail.com>
References: <8d9c7220b1d2cf126bd2030e5d232ec06f761440.1521075485.git.digetx@gmail.com>
 <00cf4565238be471c90e5823e53e0ed504869bfe.1521075485.git.digetx@gmail.com>
 <20180315102905.GB15393@ulmo>
 <16e06ec0-af24-e2c1-b400-2ff1acae931c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <16e06ec0-af24-e2c1-b400-2ff1acae931c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 15.03.2018 15:42, Dmitry Osipenko wrote:
> On 15.03.2018 13:29, Thierry Reding wrote:
>> On Thu, Mar 15, 2018 at 04:00:24AM +0300, Dmitry Osipenko wrote:
>>> Keep old 'dependent' state of unaffected planes, this way new state takes
>>> into account current state of unaffected planes.
>>>
>>> Fixes: ebae8d07435a ("drm/tegra: dc: Implement legacy blending")
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/gpu/drm/tegra/plane.c | 15 ++++++---------
>>>  1 file changed, 6 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
>>> index fc37dcf8c458..3c0cb6a04c66 100644
>>> --- a/drivers/gpu/drm/tegra/plane.c
>>> +++ b/drivers/gpu/drm/tegra/plane.c
>>> @@ -287,13 +287,11 @@ unsigned int tegra_plane_format_adjust(unsigned int opaque)
>>>  	return opaque;
>>>  }
>>>  
>>> -unsigned int tegra_plane_get_overlap_index(struct tegra_plane *plane,
>>> -					   struct tegra_plane *other)
>>> +static unsigned int tegra_plane_get_overlap_index(struct tegra_plane *plane,
>>> +						  struct tegra_plane *other)
>>
>> I'd prefer this to be a separate patch to keep the diff down to make
>> this easier to apply to v4.16. I can do that when I apply, no need to
>> resend.
> 
> Okay. But now I'm thinking that it's probably not really worth to backport this
> patch at all because it doesn't fix blending entirely, but only makes it good
> enough to show cursor plane properly. I'll send V2.

Ah, didn't notice that I don't have to re-send. I've spotted other problem in
the patch, so will just send V2 ;)
