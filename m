From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 08:35:43 -0700
Message-ID: <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <38d921a7-5cdf-8d0a-2772-4399dd1a96a0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/5/20 1:35 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
>> +                                    struct tegra_channel_buffer *buf)
>> +{
>> +     int err =3D 0;
>> +     u32 thresh, value, frame_start, mw_ack_done;
>> +     int bytes_per_line =3D chan->format.bytesperline;
>> +
>> +     /* program buffer address by using surface 0 */
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB,
>> +                  (u64)buf->addr >> 32);
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
>> +
>> +     /*
>> +      * Tegra VI block interacts with host1x syncpt for synchronizing
>> +      * programmed condition of capture state and hardware operation.
>> +      * Frame start and Memory write acknowledge syncpts has their own
>> +      * FIFO of depth 2.
>> +      *
>> +      * Syncpoint trigger conditions set through VI_INCR_SYNCPT registe=
r
>> +      * are added to HW syncpt FIFO and when the HW triggers, syncpt
>> +      * condition is removed from the FIFO and counter at syncpoint ind=
ex
>> +      * will be incremented by the hardware and software can wait for
>> +      * counter to reach threshold to synchronize capturing frame with =
the
>> +      * hardware capture events.
>> +      */
>> +
>> +     /* increase channel syncpoint threshold for FRAME_START */
>> +     thresh =3D host1x_syncpt_incr_max(chan->frame_start_sp, 1);
>> +
>> +     /* Program FRAME_START trigger condition syncpt request */
>> +     frame_start =3D VI_CSI_PP_FRAME_START(chan->portno);
>> +     value =3D VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
>> +             host1x_syncpt_id(chan->frame_start_sp);
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
>> +
>> +     /* increase channel syncpoint threshold for MW_ACK_DONE */
>> +     buf->mw_ack_sp_thresh =3D host1x_syncpt_incr_max(chan->mw_ack_sp, =
1);
>> +
>> +     /* Program MW_ACK_DONE trigger condition syncpt request */
>> +     mw_ack_done =3D VI_CSI_MW_ACK_DONE(chan->portno);
>> +     value =3D VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
>> +             host1x_syncpt_id(chan->mw_ack_sp);
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
>> +
>> +     /* enable single shot capture */
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
>> +     chan->capture_reqs++;
>> +
>> +     /* wait for syncpt counter to reach frame start event threshold */
>> +     err =3D host1x_syncpt_wait(chan->frame_start_sp, thresh,
>> +                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>> +     if (err) {
>> +             dev_err(&chan->video.dev,
>> +                     "frame start syncpt timeout: %d\n", err);
>> +             /* increment syncpoint counter for timedout events */
>> +             host1x_syncpt_incr(chan->frame_start_sp);
> Why incrementing is done while hardware is still active?
>
> The sync point's state needs to be completely reset after resetting
> hardware. But I don't think that the current upstream host1x driver
> supports doing that, it's one of the known-long-standing problems of the
> host1x driver.
>
> At least the sp->max_val incrementing should be done based on the actual
> syncpoint value and this should be done after resetting hardware.

upstream host1x driver don't have API to reset or to equalize max value=20
with min/load value.

So to synchronize missed event, incrementing HW syncpt counter.

This should not impact as we increment this in case of missed events only.

>> +             spin_lock(&chan->sp_incr_lock);
>> +             host1x_syncpt_incr(chan->mw_ack_sp);
>> +             spin_unlock(&chan->sp_incr_lock);
>> +             /* clear errors and recover */
>> +             tegra_channel_capture_error_recover(chan);
>> +             release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
>> +             return err;
>> +     }
