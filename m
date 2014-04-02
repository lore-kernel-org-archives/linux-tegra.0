From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH 11/12] drm/nouveau: support GK20A in
 nouveau_accel_init()
Date: Thu, 3 Apr 2014 09:14:48 +1000
Message-ID: <CACAvsv4uUoeb9KrVS-6PGjtruWXSOakgCMBspSn6EmAVUO=YrA@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-12-git-send-email-acourbot@nvidia.com>
 <20140324231014.GI17218@mithrandir>
 <CACAvsv4FHqwAF6FOaMF1sQLwAfBOd6uFgsZ+VdwCHoR4qsVbVw@mail.gmail.com>
 <CAAVeFuL-v2dntm5kgXUaC1-0dw2PgPnmpffPpa_dpwYZqmhvpA@mail.gmail.com>
 <CAKb7UvjAATgH3hqs4Vx4RkRsph9uAQdxyjCYmxZ8mq6ZgRh8gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvjAATgH3hqs4Vx4RkRsph9uAQdxyjCYmxZ8mq6ZgRh8gA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Alexandre Courbot <gnurou@gmail.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 3, 2014 at 12:23 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Wed, Apr 2, 2014 at 10:14 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
>>>>> +     /* Need to figure out how to handle sw for gk20a */
>>>>> +     if (device->chipset == 0xea)
>>>>> +             goto skip_sw_init;
>>>>
>>>> The commit message makes it sound like SW isn't needed since gk20a
>>>> "lacks any display hardware". In that case the comment here doesn't make
>>>> much sense.
>>
>> Correct. As far as I have looked (that is, not very far), SW methods
>> are used for display-related functions, but there might be other
>> use-cases too. Maybe someone who knows better can confirm?
>
> http://cgit.freedesktop.org/~darktama/nouveau/tree/nvkm/engine/software/nvc0.c
>
> Take a look at nvc0_software_mthd_mp_control -- that's used in the
> mesa driver to... well, control those things :) They're related to
> PGRAPH, which should be available on the GK20A. [Not sure what they do
> though. One of them is about turning off error reporting.]
Hm, I don't know why I didn't notice that was there for now.. I
wouldn't be entirely surprised if nvidia had reserved method ids in
the 3d object class that were supposed to be used for this, rather
than from a sw object class..

>
>   -ilia
