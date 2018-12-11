From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] host1x: cdma: use completion instead of semaphore
Date: Tue, 11 Dec 2018 11:11:38 +0100
Message-ID: <CAK8P3a08VEReXUZ39f3iQS3wUZSwKYObnn-jQrUiMJ4Gyx6hVQ@mail.gmail.com>
References: <20181210215119.1903413-1-arnd@arndb.de> <20181211100832.GE14426@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211100832.GE14426@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Dmitry Osipenko <digetx@gmail.com>, emil.fsw@goode.io, dri-devel <dri-devel@lists.freedesktop.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 11, 2018 at 11:08 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Mon, Dec 10, 2018 at 10:51:04PM +0100, Arnd Bergmann wrote:
> > In this usage, the two are completely equivalent, but the
> > completion documents better what is going on, and we generally
> > try to avoid semaphores these days.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/gpu/host1x/cdma.c | 6 +++---
> >  drivers/gpu/host1x/cdma.h | 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
>
> My understanding is that potentially many userspace processes could be
> blocking on this, which I think is the reason for it being a semaphore.
> Is the completion going to work for those cases as well?

Yes, it behaves the exact same way here.

       Arnd
