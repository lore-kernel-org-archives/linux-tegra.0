From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Add kerneldoc for UAPI
Date: Fri, 18 May 2018 23:58:19 +0200
Message-ID: <20180518215819.GA28123@ulmo>
References: <20180517154132.10058-8-thierry.reding@gmail.com>
 <20180518203337.26476-1-thierry.reding@gmail.com>
 <71541779-b4a9-43f3-f3e0-dd74e244ba93@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0696470385=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <71541779-b4a9-43f3-f3e0-dd74e244ba93@gmail.com>
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


--===============0696470385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 19, 2018 at 12:42:22AM +0300, Dmitry Osipenko wrote:
> On 18.05.2018 23:33, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Document the userspace ABI with kerneldoc to provide some information on
> > how to use it.
> >=20
> > v2:
> > - keep GEM object creation flags for ABI compatibility
> > - fix typo in struct drm_tegra_syncpt_incr kerneldoc
> > - fix typos in struct drm_tegra_submit kerneldoc
> > - reworded some descriptions as suggested
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  include/uapi/drm/tegra_drm.h | 480 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 471 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
> > index 99e15d82d1e9..7e121c69cd9a 100644
> > --- a/include/uapi/drm/tegra_drm.h
> > +++ b/include/uapi/drm/tegra_drm.h
> > @@ -32,143 +32,605 @@ extern "C" {
> >  #define DRM_TEGRA_GEM_CREATE_TILED     (1 << 0)
> >  #define DRM_TEGRA_GEM_CREATE_BOTTOM_UP (1 << 1)
> > =20
> > +/**
> > + * struct drm_tegra_gem_create - parameters for the GEM object creatio=
n IOCTL
> > + */
> >  struct drm_tegra_gem_create {
> > +	/**
> > +	 * @size:
> > +	 *
> > +	 * The size, in bytes, of the buffer object to be created.
> > +	 */
> >  	__u64 size;
> > +
> > +	/**
> > +	 * @flags:
> > +	 *
> > +	 * A bitmask of flags that influence the creation of GEM objects:
> > +	 *
> > +	 * DRM_TEGRA_GEM_CREATE_TILED
> > +	 *   Use the 16x16 tiling format for this buffer.
> > +	 *
> > +	 * DRM_TEGRA_GEM_CREATE_BOTTOM_UP
> > +	 *   The buffer has a bottom-up layout.
> > +	 */
> >  	__u32 flags;
> > +
> > +	/**
> > +	 * @handle:
> > +	 *
> > +	 * The handle of the created GEM object. Set by the kernel upon
> > +	 * successful completion of the IOCTL.
> > +	 */
> >  	__u32 handle;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_gem_mmap - parameters for the GEM mmap IOCTL
> > + */
> >  struct drm_tegra_gem_mmap {
> > +	/**
> > +	 * @handle:
> > +	 *
> > +	 * Handle of the GEM object to obtain an mmap offset for.
> > +	 */
> >  	__u32 handle;
> > +
> > +	/**
> > +	 * @pad:
> > +	 *
> > +	 * Structure padding that may be used in the future. Must be 0.
> > +	 */
> >  	__u32 pad;
> > +
> > +	/**
> > +	 * @offset:
> > +	 *
> > +	 * The mmap offset for the given GEM object. Set by the kernel upon
> > +	 * successful completion of the IOCTL.
> > +	 */
> >  	__u64 offset;
> >  };
> > =20
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
> > +	 * The current syncpoint value. Set by the kernel upon successful
> > +	 * completion of the IOCTL.
> > +	 */
> >  	__u32 value;
> >  };
> > =20
> > +/**
> > + * struct drm_tegra_syncpt_incr - parameters for the increment syncpoi=
nt IOCTL
> > + */
> >  struct drm_tegra_syncpt_incr {
> > +	/**
> > +	 * @id:
> > +	 *
> > +	 * ID of the syncpoint to increment.
> > +	 */
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
> > +	 * The new syncpoint value after the wait. Set by the kernel upon
> > +	 * successful completion of the IOCTL.
> > +	 */
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
> > +	 * The application context of this channel. Set by the kernel upon
> > +	 * successful completion of the IOCTL. This context needs to be passed
> > +	 * to the DRM_TEGRA_CHANNEL_CLOSE or the DRM_TEGRA_SUBMIT IOCTLs.
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
> > +	 * Index of the client syncpoint for which to obtain the ID.
> > +	 */
> >  	__u32 index;
> > +
> > +	/**
> > +	 * @id:
> > +	 *
> > +	 * The ID of the given syncpoint. Set by the kernel upon successful
> > +	 * completion of the IOCTL.
> > +	 */
> >  	__u32 id;
> >  };
> > =20
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
> > +	 * The ID of the wait base corresponding to the client syncpoint. Set
> > +	 * by the kernel upon successful completion of the IOCTL.
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
> > +		 * Offset, in bytes, into the command buffer at which to
> > +		 * insert the relocated address.
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
> > +		 * Offset, in bytes, into the target GEM object at which the
> > +		 * relocated data starts.
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
>=20
> I'm not sure whether this "pointer to @num_syncpts" makes sense, shouldn'=
t it be:
>=20
> 	A pointer to &struct drm_tegra_syncpt structures that...
>=20
> ?
>=20
> Same for the @cmdbufs/@relocs/@waitchks members.

I wanted to have the references to those fields in the text so that it
becomes obvious that num_syncpts defines the number of entries in this
syncpts array.

Perhaps a better formulation would be:

	A pointer to an array of @num_syncpts &struct drm_tegra_syncpt
	structure that...

?

Thierry

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr/THkACgkQ3SOs138+
s6FLqhAAlKfuYfq6HABurPRVkGRDIqZ2jBBJnxLdFf9LMwYox5MZ7gd/W/8SZa9U
Ytj0/x/ci8erEZr+7TzbP8jNHl6KHBNPQTg0RsAckMYV5M6ZSDZ78B0I72ROz+W2
ZYbGIDOfgA5H3hG73qEwXL5fJRBAmEEOQ07H75RPMe7zbeWQgNZuVqscocdGX5xv
9O8d401Wx9Wx5id9aaU+zaB1mmWlrKfGKdvajXY5QgtLe/UJ8Rcle3+n/6SKbMra
OiBFn5hR+9Tg8aUiqCQGB8tSYoan4Su1kEIoTfoQd5YMpNB/usNCtL/bNQ/WH5/n
HDcWRQTTIrC1qTxmK507zmLy82Rpn0PRXrl0LQWceTdcl/ZaxSh+SHY08WQo2qAG
MZOmkzqPxaqg+VVbTvLmfKSyUW7XGytN0i7SflvApc+OMlBH0GoMg5O4CyOIzCjv
vBcXOxZeFG80G4KKNIKMfLFkhlKRAMvNFDOI2NBF8x9i4xr/GBCLLUrH3dcQZYMS
uwHyrgybsP0DSw7m87es55lXqxgvqR2l6EHfjmNqWe39Zuhya1eO1C7nk0yAnztn
EPc9jUqV8tHDVW9sHHFxSBViwUvBOz8IWWStjdbYjxGYDt6uMrpVQ9+8+2WWczQo
mpLM8FPTVvKh5wGsgbG0wGukMk/WUXqLr5fwgXiNpq+vsUVxWfQ=
=vBrl
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

--===============0696470385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0696470385==--
