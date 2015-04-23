From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] USB: ehci-tegra: fix inefficient copy of
 unaligned buffers
Date: Thu, 23 Apr 2015 16:45:08 +0200
Message-ID: <20150423144508.GA22193@localhost>
References: <1429798012-21916-1-git-send-email-johan@kernel.org>
 <1429798012-21916-3-git-send-email-johan@kernel.org>
 <CAH6sp9PFE_kQn5hpXaGhn6d_WTtKZUbfS-DpDRfRCKbBj9S4fQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAH6sp9PFE_kQn5hpXaGhn6d_WTtKZUbfS-DpDRfRCKbBj9S4fQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frans Klaver <fransklaver-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 23, 2015 at 04:31:51PM +0200, Frans Klaver wrote:
> On Thu, Apr 23, 2015 at 4:06 PM, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> >  static void free_dma_aligned_buffer(struct urb *urb)
> >  {
> >         struct dma_aligned_buffer *temp;
> > +       size_t length;
> >
> >         if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
> >                 return;
> > @@ -311,9 +312,14 @@ static void free_dma_aligned_buffer(struct urb *urb)
> >         temp = container_of(urb->transfer_buffer,
> >                 struct dma_aligned_buffer, data);
> >
> > -       if (usb_urb_dir_in(urb))
> > -               memcpy(temp->old_xfer_buffer, temp->data,
> > -                      urb->transfer_buffer_length);
> > +       if (usb_urb_dir_in(urb)) {
> > +               if (usb_pipeisoc(urb->pipe))
> > +                       length = urb->transfer_buffer_length;
> > +               else
> > +                       length = urb->actual_length;
> > +
> > +               memcpy(temp->old_xfer_buffer, temp->data, length);
> > +       }
> >         urb->transfer_buffer = temp->old_xfer_buffer;
> >         kfree(temp->kmalloc_ptr);
> 
> Out of curiosity: any reason not to declare that length variable
> inside this new compound?

Just my style preference.

Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
