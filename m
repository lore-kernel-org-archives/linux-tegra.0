From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] drm/tegra: dc: Dedicate overlay plane to cursor on
 older Tegra's
Date: Sat, 17 Mar 2018 18:22:05 +0300
Message-ID: <9b2ba155-8db0-7a51-e09a-015c8eb90612@gmail.com>
References: <8d9c7220b1d2cf126bd2030e5d232ec06f761440.1521075485.git.digetx@gmail.com>
 <f48200af36c3358d549fc451fbc754c2a37b0d47.1521075485.git.digetx@gmail.com>
 <20180315104511.GC15393@ulmo>
 <CAKMK7uFo3YZ2P4CFywwyZLJS0tPgwOmn8dG3g84pMF+xV52D0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKMK7uFo3YZ2P4CFywwyZLJS0tPgwOmn8dG3g84pMF+xV52D0w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On 16.03.2018 10:36, Daniel Vetter wrote:
> On Thu, Mar 15, 2018 at 11:45 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
>> On Thu, Mar 15, 2018 at 04:00:25AM +0300, Dmitry Osipenko wrote:
>>> Older Tegra's do not support RGBA format for the cursor, but instead
>>> overlay plane could be used for it. Since there is no much use for the
>>> overlays on a regular desktop and HW-accelerated cursor is much better
>>> than a SW cursor, let's dedicate one overlay plane to the mouse cursor.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/gpu/drm/tegra/dc.c | 28 +++++++++++++++++++++++-----
>>>  1 file changed, 23 insertions(+), 5 deletions(-)
>>
>> Applied. I'm not entirely happy that we need to sacrifice one of the
>> overlay windows for this, but you're right, it's probably okay given
>> how little planes are used on a regular desktop.
>>
>> We could always provide a module parameter to switch this on and off
>> if that's ever something we want.
> 
> The idea with universal planes is that you can (at least try to) use
> the cursor overlay plane as a normal plane. It is only a hint to
> userspace, there's no requirement anywhere in atomic that you only use
> it as a cursor. That way desktops get a good hint for what the cursor
> plane should be, everyone else can still use all the planes.

Indeed, thank you for pointing at it. That is a nice feature.
