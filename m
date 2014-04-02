From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Nouveau] [PATCH 12/12] drm/nouveau: support for probing GK20A
Date: Wed, 2 Apr 2014 23:19:10 +0900
Message-ID: <CAAVeFuJAs4EY0Tu0Vygy4Oa0j3O=k4TV8NELnirJw+rwF1F7Xg@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-13-git-send-email-acourbot@nvidia.com>
 <CACAvsv561r73CmL0rf_bvM9JVMV+E7J_VT3ZDuwyCxviJBa8Cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv561r73CmL0rf_bvM9JVMV+E7J_VT3ZDuwyCxviJBa8Cw@mail.gmail.com>
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 26, 2014 at 1:28 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
> On Mon, Mar 24, 2014 at 6:42 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>> Set the correct subdev/engine classes when GK20A (0xea) is probed.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/drm/nouveau/core/engine/device/nve0.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>> index 987edbc30a09..8509dd57de1f 100644
>> --- a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>> +++ b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>> @@ -156,6 +156,26 @@ nve0_identify(struct nouveau_device *device)
>>                 device->oclass[NVDEV_ENGINE_PPP    ] = &nvc0_ppp_oclass;
>>                 device->oclass[NVDEV_ENGINE_PERFMON] = &nve0_perfmon_oclass;
>>                 break;
>> +       case 0xea:
>> +               device->cname = "GK20A";
>> +               device->oclass[NVDEV_SUBDEV_MC     ] =  nvc3_mc_oclass;
>> +               device->oclass[NVDEV_SUBDEV_BUS    ] =  nvc0_bus_oclass;
>> +               device->oclass[NVDEV_SUBDEV_TIMER  ] = &nv04_timer_oclass;
> As per note on the PTIMER patch, can just switch this to
> "gk20a_timer_oclass" on the latest code.

Just saw your patch and will try to use it for the next version (if I
can figure out how to reapply it to a Linux tree).
