From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/12] drm/nouveau/timer: skip calibration on
	GK20A
Date: Wed, 26 Mar 2014 14:19:49 +1000
Message-ID: <CACAvsv54BF3cD6y59=kQ=1j-S9tGixTz_J3gx2mbOEkB2eQ4cA@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-3-git-send-email-acourbot@nvidia.com>
 <20140324215408.GB17218@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140324215408.GB17218@mithrandir>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 25, 2014 at 7:54 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Mar 24, 2014 at 05:42:24PM +0900, Alexandre Courbot wrote:
>> GK20A's timer is directly attached to the system timer and cannot be
>> calibrated. Skip the calibration phase on that chip since the
>> corresponding registers do not exist.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c | 19 +++++++++++++------
>>  1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
>> index c0bdd10358d7..822fe0d8a871 100644
>> --- a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
>> +++ b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
>> @@ -185,6 +185,10 @@ nv04_timer_init(struct nouveau_object *object)
>>       if (ret)
>>               return ret;
>>
>> +     /* gk20a does not have the calibration registers */
>> +     if (device->chipset == 0xea)
>> +             goto skip_clk_init;
>
> I'm concerned that this won't scale in the future. Perhaps a better
> solution would be to add a "flags" or "features" field to struct
> nouveau_device along with feature bits such as HAS_CALIBRATION or
> similar.
>
> That way we don't have to touch this code for every new future Tegra
> chip. Unless perhaps if there's a reason to expect things to change in
> newer generations.
I've already handled this in a slightly different way in the tree I'd
previously pointed Alex at (I think!), as I needed to do the same for
GM107.

Should just be able to use that implementation (so, just change the
probe patch) here too.

Thanks,
Ben.

>
> Thierry
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
