From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 7/7] drm/tegra: Add kerneldoc for UAPI
Date: Fri, 18 May 2018 22:12:02 +0200
Message-ID: <20180518201202.GA21358@ulmo>
References: <20180517154132.10058-1-thierry.reding@gmail.com>
 <20180517154132.10058-8-thierry.reding@gmail.com>
 <2628cd65-3aa1-300e-c952-4a5914544fb6@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0177726317=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2628cd65-3aa1-300e-c952-4a5914544fb6@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0177726317==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 08:19:55PM +0300, Dmitry Osipenko wrote:
> On 17.05.2018 18:41, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Document the userspace ABI with kerneldoc to provide some information on
> > how to use it.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/gem.c  |   4 +-
> >  include/uapi/drm/tegra_drm.h | 480 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 468 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> > index 387ba1dfbe0d..e2987a19541d 100644
> > --- a/drivers/gpu/drm/tegra/gem.c
> > +++ b/drivers/gpu/drm/tegra/gem.c
> > @@ -291,10 +291,10 @@ struct tegra_bo *tegra_bo_create(struct drm_devic=
e *drm, size_t size,
> >  	if (err < 0)
> >  		goto release;
> > =20
> > -	if (flags & DRM_TEGRA_GEM_CREATE_TILED)
> > +	if (flags & DRM_TEGRA_GEM_TILED)
> >  		bo->tiling.mode =3D TEGRA_BO_TILING_MODE_TILED;
> > =20
> > -	if (flags & DRM_TEGRA_GEM_CREATE_BOTTOM_UP)
> > +	if (flags & DRM_TEGRA_GEM_BOTTOM_UP)
> >  		bo->flags |=3D TEGRA_BO_BOTTOM_UP;
> > =20
> >  	return bo;
> > diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
> > index 99e15d82d1e9..86a7b1e7559d 100644
> > --- a/include/uapi/drm/tegra_drm.h
> > +++ b/include/uapi/drm/tegra_drm.h
> > @@ -29,146 +29,598 @@
> >  extern "C" {
> >  #endif
> > =20
> > -#define DRM_TEGRA_GEM_CREATE_TILED     (1 << 0)
> > -#define DRM_TEGRA_GEM_CREATE_BOTTOM_UP (1 << 1)
> > +#define DRM_TEGRA_GEM_TILED		(1 << 0)
> > +#define DRM_TEGRA_GEM_BOTTOM_UP		(1 << 1)
> > +#define DRM_TEGRA_GEM_FLAGS		(DRM_TEGRA_GEM_TILED | \
> > +					 DRM_TEGRA_GEM_BOTTOM_UP)
>=20
> The current userspace won't compile with the above changes, so this is th=
e ABI
> breakage. Please keep the old DRM_TEGRA_GEM_CREATE_* DRM_TEGRA_GEM_* flag=
s for now.

It looks like I fumbled this during a rebase and didn't catch it. I've
left the original flags in.

[...]
> > +/**
> > + * struct drm_tegra_syncpt_read - parameters for the read syncpoint IO=
CTL
> > + */
> >  struct drm_tegra_syncpt_read {
> > +	/**
> > +	 * @id:
> > +	 *
> > +	 * ID of the syncpoint to read the current value from.
> > +	 */
> >  	__u32 id;
> > +
> > +	/**
> > +	 * @value:
> > +	 *
> > +	 * Return location for the current syncpoint value.
> > +	 */>  	__u32 value;
> >  };
>=20
> What about:
>=20
> Returned value of the given syncpoint.
>=20
> Could we replace "return location for the.." with just "Returned.." in ot=
her
> places too? My mind is stuttering while reading "location for the value",=
 though
> I know that my english isn't ideal and maybe it's only me.

How about something a little more explicit, like:

	The current value of the syncpoint. Will be set by the kernel
	upon successful completion of the IOCTL.

?

> > =20
> > +/**
> > + * struct drm_tegra_syncpt_incr - parameters for the increment syncpoi=
nt IOCTL
> > + */
> >  struct drm_tegra_syncpt_incr {
> > +	/**
> > +	 * @id:
> > +	 *
> > +	 * ID of the syncpoint to read the current value from.
> > +	 */
>=20
> Cut-n-pasted comment. Change to:
>=20
> ID of the syncpoint to increment.

Good catch. Fixed.

> >  	__u32 id;
> > +
> > +	/**
> > +	 * @pad:
> > +	 *
> > +	 * Structure padding that may be used in the future. Must be 0.
> > +	 */
> >  	__u32 pad;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_syncpt_wait - parameters for the wait syncpoint IO=
CTL
> > + */
> >  struct drm_tegra_syncpt_wait {
> > +	/**
> > +	 * @id:
> > +	 *
> > +	 * ID of the syncpoint to wait on.
> > +	 */
> >  	__u32 id;
> > +
> > +	/**
> > +	 * @thresh:
> > +	 *
> > +	 * Threshold value for which to wait.
> > +	 */
> >  	__u32 thresh;
> > +
> > +	/**
> > +	 * @timeout:
> > +	 *
> > +	 * Timeout, in milliseconds, to wait.
> > +	 */
> >  	__u32 timeout;
> > +
> > +	/**
> > +	 * @value:
> > +	 *
> > +	 * Return value for the current syncpoint value.
> > +	 */
> Just:
>=20
> Returned value of the syncpoint.

Will reword this similar to the above.

> >  	__u32 value;
> >  };
> > =20
> >  #define DRM_TEGRA_NO_TIMEOUT	(0xffffffff)
> > =20
> > +/**
> > + * struct drm_tegra_open_channel - parameters for the open channel IOC=
TL
> > + */
> >  struct drm_tegra_open_channel {
> > +	/**
> > +	 * @client:
> > +	 *
> > +	 * The client ID for this channel.
> > +	 */
> >  	__u32 client;
> > +
> > +	/**
> > +	 * @pad:
> > +	 *
> > +	 * Structure padding that may be used in the future. Must be 0.
> > +	 */
> >  	__u32 pad;
> > +
> > +	/**
> > +	 * @context:
> > +	 *
> > +	 * Return location for the application context of this channel. This
> > +	 * context needs to be passed to the DRM_TEGRA_CHANNEL_CLOSE or the
> > +	 * DRM_TEGRA_SUBMIT IOCTLs.
> > +	 */
> >  	__u64 context;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_close_channel - parameters for the close channel I=
OCTL
> > + */
> >  struct drm_tegra_close_channel {
> > +	/**
> > +	 * @context:
> > +	 *
> > +	 * The application context of this channel. This is obtained from the
> > +	 * DRM_TEGRA_OPEN_CHANNEL IOCTL.
> > +	 */
> >  	__u64 context;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_get_syncpt - parameters for the get syncpoint IOCTL
> > + */
> >  struct drm_tegra_get_syncpt {
> > +	/**
> > +	 * @context:
> > +	 *
> > +	 * The application context identifying the channel for which to obtain
> > +	 * the syncpoint ID.
> > +	 */
> >  	__u64 context;
> > +
> > +	/**
> > +	 * @index:
> > +	 *
> > +	 * Channel-relative index of the syncpoint for which to obtain the ID.
> > +	 */
> >  	__u32 index;
>=20
> Client-relative. And what about:
>=20
> Clients syncpoint index for which to obtain the ID.

I'll try to find some better wording for this.

> > +
> > +	/**
> > +	 * @id:
> > +	 *
> > +	 * Return location for the ID of the given syncpoint.
> > +	 */
> >  	__u32 id;
> >  };>
> > +/**
> > + * struct drm_tegra_get_syncpt_base - parameters for the get wait base=
 IOCTL
> > + */
> >  struct drm_tegra_get_syncpt_base {
> > +	/**
> > +	 * @context:
> > +	 *
> > +	 * The application context identifying for which channel to obtain the
> > +	 * wait base.
> > +	 */
> >  	__u64 context;
> > +
> > +	/**
> > +	 * @syncpt:
> > +	 *
> > +	 * ID of the syncpoint for which to obtain the wait base.
> > +	 */
> >  	__u32 syncpt;
> > +
> > +	/**
> > +	 * @id:
> > +	 *
> > +	 * Return location for the ID of the wait base.
> > +	 */
> >  	__u32 id;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_syncpt - syncpoint increment operation
> > + */
> >  struct drm_tegra_syncpt {
> > +	/**
> > +	 * @id:
> > +	 *
> > +	 * ID of the syncpoint to operate on.
> > +	 */
> >  	__u32 id;
> > +
> > +	/**
> > +	 * @incrs:
> > +	 *
> > +	 * Number of increments to perform for the syncpoint.
> > +	 */
> >  	__u32 incrs;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_cmdbuf - structure describing a command buffer
> > + */
> >  struct drm_tegra_cmdbuf {
> > +	/**
> > +	 * @handle:
> > +	 *
> > +	 * Handle to a GEM object containing the command buffer.
> > +	 */
> >  	__u32 handle;
> > +
> > +	/**
> > +	 * @offset:
> > +	 *
> > +	 * Offset, in bytes, into the GEM object identified by @handle at
> > +	 * which the command buffer starts.
> > +	 */
> >  	__u32 offset;
> > +
> > +	/**
> > +	 * @words:
> > +	 *
> > +	 * Number of 32-bit words in this command buffer.
> > +	 */
> >  	__u32 words;
> > +
> > +	/**
> > +	 * @pad:
> > +	 *
> > +	 * Structure padding that may be used in the future. Must be 0.
> > +	 */
> >  	__u32 pad;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_reloc - GEM object relocation structure
> > + */
> >  struct drm_tegra_reloc {
> >  	struct {
> > +		/**
> > +		 * @cmdbuf.handle:
> > +		 *
> > +		 * Handle to the GEM object containing the command buffer for
> > +		 * which to perform this GEM object relocation.
> > +		 */
> >  		__u32 handle;
> > +
> > +		/**
> > +		 * @cmdbuf.offset:
> > +		 *
> > +		 * Offset into the command buffer at which to insert the the
>=20
> Offset, in bytes,

Done.

> > +		 * relocated address.
> > +		 */
> >  		__u32 offset;
> >  	} cmdbuf;
> >  	struct {
> > +		/**
> > +		 * @target.handle:
> > +		 *
> > +		 * Handle to the GEM object to be relocated.
> > +		 */
> >  		__u32 handle;
> > +
> > +		/**
> > +		 * @target.offset:
> > +		 *
> > +		 * Offset into the target GEM object at which the relocated
>=20
> Offset, in bytes,

Done.

> > +		 * data starts.
> > +		 */
> >  		__u32 offset;
> >  	} target;
> > +
> > +	/**
> > +	 * @shift:
> > +	 *
> > +	 * The number of bits by which to shift relocated addresses.
> > +	 */
> >  	__u32 shift;
> > +
> > +	/**
> > +	 * @pad:
> > +	 *
> > +	 * Structure padding that may be used in the future. Must be 0.
> > +	 */
> >  	__u32 pad;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_waitchk - wait check structure
> > + */
> >  struct drm_tegra_waitchk {
> > +	/**
> > +	 * @handle:
> > +	 *
> > +	 * Handle to the GEM object containing a command stream on which to
> > +	 * perform the wait check.
> > +	 */
> >  	__u32 handle;
> > +
> > +	/**
> > +	 * @offset:
> > +	 *
> > +	 * Offset, in bytes, of the location in the command stream to perform
> > +	 * the wait check on.
> > +	 */
> >  	__u32 offset;
> > +
> > +	/**
> > +	 * @syncpt:
> > +	 *
> > +	 * ID of the syncpoint to wait check.
> > +	 */
> >  	__u32 syncpt;
> > +
> > +	/**
> > +	 * @thresh:
> > +	 *
> > +	 * Threshold value for which to check.
> > +	 */
> >  	__u32 thresh;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_submit - job submission structure
> > + */
> >  struct drm_tegra_submit {
> > +	/**
> > +	 * @context:
> > +	 *
> > +	 * The application context identifying the channel to use for the
> > +	 * execution of this job.
> > +	 */
> >  	__u64 context;
> > +
> > +	/**
> > +	 * @num_syncpts:
> > +	 *
> > +	 * The number of syncpoints operated on by this job.
> > +	 */
> >  	__u32 num_syncpts;
> > +
> > +	/**
> > +	 * @num_cmdbufs:
> > +	 *
> > +	 * The number of command buffers to execute as part of this job.
> > +	 */
> >  	__u32 num_cmdbufs;
> > +
> > +	/**
> > +	 * @num_relocs:
> > +	 *
> > +	 * The number of relocations to perform before executing this job.
> > +	 */
> >  	__u32 num_relocs;
> > +
> > +	/**
> > +	 * @num_waitchks:
> > +	 *
> > +	 * The number of wait checks to perform as part of this job.
> > +	 */
> >  	__u32 num_waitchks;
> > +
> > +	/**
> > +	 * @waitchk_mask:
> > +	 *
> > +	 * Bitmask of valid wait checks.
> > +	 */
> >  	__u32 waitchk_mask;
> > +
> > +	/**
> > +	 * @timeout:
> > +	 *
> > +	 * Timeout, in milliseconds, before this job is cancelled.
> > +	 */
> >  	__u32 timeout;
> > +
> > +	/**
> > +	 * @syncpts:
> > +	 *
> > +	 * A pointer to @num_syncpts &struct drm_tegra_syncpt structures that
> > +	 * specify the syncpoint operations performed as part of this job.
> > +	 */
> >  	__u64 syncpts;
> > +
> > +	/**
> > +	 * @cmdbufs:
> > +	 *
> > +	 * A pointer to @num_cmdbufs &struct drm_tegra_cmdbuf_legacy
>=20
> We don't have drm_tegra_cmdbuf_legacy yet, should be drm_tegra_cmdbuf.

Done.

> > +	 * structures that define the command buffers to execute as part of
> > +	 * this job.
> > +	 */
> >  	__u64 cmdbufs;
> > +
> > +	/**
> > +	 * @relocs:
> > +	 *
> > +	 * A pointer to @num_relocs &struct drm_tegra_reloc_legacy structures
> > +	 * that specify the relocations that need to be performed before
> > +	 * executing this job.
> > +	 */
>=20
> Same as for drm_tegra_cmdbuf_legacy.

Done.

> >  	__u64 relocs;
> > +
> > +	/**
> > +	 * @waitchks:
> > +	 *
> > +	 * A pointer to @num_waitchks &struct drm_tegra_waitchk structures
> > +	 * that specify the wait checks to be performed while executing this
> > +	 * job.
> > +	 */
> >  	__u64 waitchks;
> > -	__u32 fence;		/* Return value */
> > =20
> > -	__u32 reserved[5];	/* future expansion */
> > +	/**
> > +	 * @fence:
> > +	 *
> > +	 * Return location for the threshold of the syncpoint associated with
> > +	 * this job. This can be used with the DRM_TEGRA_SYNCPT_WAIT IOCTL to
> > +	 * wait for this job to be finished.
> > +	 */
> > +	__u32 fence;
> > +
> > +	/**
> > +	 * @reserved:
> > +	 *
> > +	 * This field is reserved for future use. Must be 0.
> > +	 */
> > +	__u32 reserved[5];
> >  };
> > =20
> >  #define DRM_TEGRA_GEM_TILING_MODE_PITCH 0
> >  #define DRM_TEGRA_GEM_TILING_MODE_TILED 1
> >  #define DRM_TEGRA_GEM_TILING_MODE_BLOCK 2
> > =20
> > +/**
> > + * struct drm_tegra_gem_set_tiling - parameters for the set tiling IOC=
TL
> > + */
> >  struct drm_tegra_gem_set_tiling {
> > -	/* input */
> > +	/**
> > +	 * @handle:
> > +	 *
> > +	 * Handle to the GEM object for which to set the tiling parameters.
> > +	 */
> >  	__u32 handle;
> > +
> > +	/**
> > +	 * @mode:
> > +	 *
> > +	 * The tiling mode to set. Must be one of:
> > +	 *
> > +	 * DRM_TEGRA_GEM_TILING_MODE_PITCH
> > +	 *   pitch linear format
> > +	 *
> > +	 * DRM_TEGRA_GEM_TILING_MODE_TILED
> > +	 *   16x16 tiling format
> > +	 *
> > +	 * DRM_TEGRA_GEM_TILING_MODE_BLOCK
> > +	 *   16Bx2 tiling format
> > +	 */
> >  	__u32 mode;
> > +
> > +	/**
> > +	 * @value:
> > +	 *
> > +	 * The value to set for the tiling mode parameter.
> > +	 */
> >  	__u32 value;
> > +
> > +	/**
> > +	 * @pad:
> > +	 *
> > +	 * Structure padding that may be used in the future. Must be 0.
> > +	 */
> >  	__u32 pad;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_gem_get_tiling - parameters for the get tiling IOC=
TL
> > + */
> >  struct drm_tegra_gem_get_tiling {
> > -	/* input */
> > +	/**
> > +	 * @handle:
> > +	 *
> > +	 * Handle to the GEM object for which to query the tiling parameters.
> > +	 */
> >  	__u32 handle;
> > -	/* output */
> > +
> > +	/**
> > +	 * @mode:
> > +	 *
> > +	 * Return location for the tiling mode.
> > +	 */
> >  	__u32 mode;
> > +
> > +	/**
> > +	 * @value:
> > +	 *
> > +	 * Return location for the tiling mode parameter.
> > +	 */
> >  	__u32 value;
> > +
> > +	/**
> > +	 * @pad:
> > +	 *
> > +	 * Structure padding that may be used in the future. Must be 0.
> > +	 */
> >  	__u32 pad;
> >  };
> > =20
> > -#define DRM_TEGRA_GEM_BOTTOM_UP		(1 << 0)
> > -#define DRM_TEGRA_GEM_FLAGS		(DRM_TEGRA_GEM_BOTTOM_UP)
> > -
> > +/**
> > + * struct drm_tegra_gem_set_flags - parameters for the set flags IOCTL
> > + */
> >  struct drm_tegra_gem_set_flags {
> > -	/* input */
> > +	/**
> > +	 * @handle:
> > +	 *
> > +	 * Handle to the GEM object for which to set the flags.
> > +	 */
> >  	__u32 handle;
> > -	/* output */
> > +
> > +	/**
> > +	 * @flags:
> > +	 *
> > +	 * The flags to set for the GEM object.
> > +	 */
> >  	__u32 flags;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_gem_get_flags - parameters for the get flags IOCTL
> > + */
> >  struct drm_tegra_gem_get_flags {
> > -	/* input */
> > +	/**
> > +	 * @handle:
> > +	 *
> > +	 * Handle to the GEM object for which to query the flags.
> > +	 */
> >  	__u32 handle;
> > -	/* output */
> > +
> > +	/**
> > +	 * @flags:
> > +	 *
> > +	 * Return location for the flags queried from the GEM object.
> > +	 */
> >  	__u32 flags;
> >  };
> > =20

Thanks for the review. I'm going to think about a better wording for
some of the descriptions and send out a new version of this patch
individually, for review.

Thierry

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr/M48ACgkQ3SOs138+
s6Fhng/9Hr6DudXzLcYB0vRCGsa/hkjThab55Zto9ZF9d/I07hnDpIzZPt47XX5n
OhOtB6x3kGk+Z5wlv72iWdRzulQfkWyumjOYSjyJm5OJc8DpbonbCjgnqzp5fF3U
cyuJ6DdWUmbN4BX2QXuf9jce0sblvgCtNoexNI/BRrpALVBYgMMo9w27mBu7bPJm
IckUT0mKaCWAy2o3CJEknvebqQv6xVtKFf7IRnugSFXIZnywMcRbPPzX+mAA3HRo
D22NzGSb76bO/wwEDq7U7DZMlzCvGkjRyOtaBipLtOEDnW/rJtibBeoErBgGt7nU
4leJFr2P2eRHW5FKrFLdQiVQHhLegdBHVmr38k1ZIITo2tzpiWtFQLXJERXqCtYI
9UM7+rwjey93xqlT+SR9NISJ+gjnTm8dqVEsSu3QIVLCmIaIjGSdQ7FumzFJYdsB
6rlh2XDE4S1eAaj483zfZGa6fpj3H6D1FYfKoc+T8y28o6iq0LIbGsjEos5vM1jB
4u7rwB58/wIOJQ0t0c/Bcis+LLgz3kzWuqw0QeVNY2MZaDlUTFYUbGg2XQjV20zU
ylQoxUMHsp3NuoxM261t8K5fDYUNhmdf9xyq/B2qsU77KH5T2+yQaHSI3oCP3jey
ugN/y7Id1xmKDt/A/4zHEpmyD01cb7YdKiNtQKS1VHC0beQvPj0=
=BoLM
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--

--===============0177726317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0177726317==--
