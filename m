From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] gpu: host1x: Ignore clients initialization failure
Date: Thu, 16 Aug 2018 20:20:26 +0300
Message-ID: <3610451.84tSEqHynW@dimapc>
References: <20180809231211.26182-1-digetx@gmail.com> <2093022.0kn10W7Lqi@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2093022.0kn10W7Lqi@dimapc>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday, 13 August 2018 20:48:25 MSK Dmitry Osipenko wrote:
> On Friday, 10 August 2018 02:12:11 MSK Dmitry Osipenko wrote:
> > From time to time new bugs are popping up, causing some host1x client to
> > fail its initialization. Currently a single clients initialization failure
> > causes whole host1x device registration to fail, as a result a single DRM
> > sub-device initialization failure makes whole DRM initialization to fail.
> > Let's ignore clients initialization failure, as a result display panel
> > lights up even if some DRM clients (say GR2D or VIC) fail to initialize.
> > Actually VIC fails if initramfs misses the firmware file, so with this
> > change a serial console isn't needed anymore to figure out why display
> > isn't working.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> > 
> > Changelog:
> > 
> > v2: Added WARN_ON() that should get more attention than just a error
> > message. Made clients_lock to lock around the lists modification, that is
> > in line with the rest of the code.
> > 
> >  drivers/gpu/host1x/bus.c | 20 ++++++++------------
> >  1 file changed, 8 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> > index 815bdb42e3f0..07bb6b6c1260 100644
> > --- a/drivers/gpu/host1x/bus.c
> > +++ b/drivers/gpu/host1x/bus.c
> > @@ -199,19 +199,23 @@ static void host1x_subdev_unregister(struct
> > host1x_device *device, */
> > 
> >  int host1x_device_init(struct host1x_device *device)
> >  {
> > 
> > -	struct host1x_client *client;
> > +	struct host1x_client *client, *cl;
> > 
> >  	int err;
> >  	
> >  	mutex_lock(&device->clients_lock);
> > 
> > -	list_for_each_entry(client, &device->clients, list) {
> > +	list_for_each_entry_safe(client, cl, &device->clients, list) {
> > 
> >  		if (client->ops && client->ops->init) {
> >  		
> >  			err = client->ops->init(client);
> > 
> > -			if (err < 0) {
> > +			if (WARN_ON(err < 0)) {
> > 
> >  				dev_err(&device->dev,
> >  				
> >  					"failed to initialize %s: %d\n",
> >  					dev_name(client->dev), err);
> > 
> > -				goto teardown;
> > +
> > +				/* add the client to the list of idle clients */
> > +				mutex_lock(&clients_lock);
> > +				list_add_tail(&client->list, &clients);
> 
> This shall be list_move_tail(), v3 is coming.
> 
> > +				mutex_unlock(&clients_lock);

I just realized that DRM won't load if any of host1x drivers fail to probe. I 
think the behaviour should be consistent in a case of driver-probe and client-
init failures. It looks like changing drivers probe error handling will be a 
much bigger change, hence let's keep the old behaviour at least for now.
