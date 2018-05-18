From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Add kerneldoc for UAPI
Date: Sat, 19 May 2018 00:24:38 +0200
Message-ID: <20180518222438.GB29384@ulmo>
References: <20180517154132.10058-8-thierry.reding@gmail.com>
 <20180518203337.26476-1-thierry.reding@gmail.com>
 <71541779-b4a9-43f3-f3e0-dd74e244ba93@gmail.com>
 <20180518215819.GA28123@ulmo> <20180518221305.GA29384@ulmo>
 <015e6ef1-e020-f339-2517-49330cc8616a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0643957006=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <015e6ef1-e020-f339-2517-49330cc8616a@gmail.com>
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


--===============0643957006==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 19, 2018 at 01:18:05AM +0300, Dmitry Osipenko wrote:
> On 19.05.2018 01:13, Thierry Reding wrote:
> > On Fri, May 18, 2018 at 11:58:19PM +0200, Thierry Reding wrote:
> >> On Sat, May 19, 2018 at 12:42:22AM +0300, Dmitry Osipenko wrote:
> >>> On 18.05.2018 23:33, Thierry Reding wrote:
> >>>> From: Thierry Reding <treding@nvidia.com>
> >>>>
> >>>> Document the userspace ABI with kerneldoc to provide some informatio=
n on
> >>>> how to use it.
> >>>>
> >>>> v2:
> >>>> - keep GEM object creation flags for ABI compatibility
> >>>> - fix typo in struct drm_tegra_syncpt_incr kerneldoc
> >>>> - fix typos in struct drm_tegra_submit kerneldoc
> >>>> - reworded some descriptions as suggested
> >>>>
> >>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>> ---
> >>>>  include/uapi/drm/tegra_drm.h | 480 ++++++++++++++++++++++++++++++++=
++-
> >>>>  1 file changed, 471 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_d=
rm.h
> >>>> index 99e15d82d1e9..7e121c69cd9a 100644
> >>>> --- a/include/uapi/drm/tegra_drm.h
> >>>> +++ b/include/uapi/drm/tegra_drm.h
> >>>> @@ -32,143 +32,605 @@ extern "C" {
> >>>>  #define DRM_TEGRA_GEM_CREATE_TILED     (1 << 0)
> >>>>  #define DRM_TEGRA_GEM_CREATE_BOTTOM_UP (1 << 1)
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_gem_create - parameters for the GEM object crea=
tion IOCTL
> >>>> + */
> >>>>  struct drm_tegra_gem_create {
> >>>> +	/**
> >>>> +	 * @size:
> >>>> +	 *
> >>>> +	 * The size, in bytes, of the buffer object to be created.
> >>>> +	 */
> >>>>  	__u64 size;
> >>>> +
> >>>> +	/**
> >>>> +	 * @flags:
> >>>> +	 *
> >>>> +	 * A bitmask of flags that influence the creation of GEM objects:
> >>>> +	 *
> >>>> +	 * DRM_TEGRA_GEM_CREATE_TILED
> >>>> +	 *   Use the 16x16 tiling format for this buffer.
> >>>> +	 *
> >>>> +	 * DRM_TEGRA_GEM_CREATE_BOTTOM_UP
> >>>> +	 *   The buffer has a bottom-up layout.
> >>>> +	 */
> >>>>  	__u32 flags;
> >>>> +
> >>>> +	/**
> >>>> +	 * @handle:
> >>>> +	 *
> >>>> +	 * The handle of the created GEM object. Set by the kernel upon
> >>>> +	 * successful completion of the IOCTL.
> >>>> +	 */
> >>>>  	__u32 handle;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_gem_mmap - parameters for the GEM mmap IOCTL
> >>>> + */
> >>>>  struct drm_tegra_gem_mmap {
> >>>> +	/**
> >>>> +	 * @handle:
> >>>> +	 *
> >>>> +	 * Handle of the GEM object to obtain an mmap offset for.
> >>>> +	 */
> >>>>  	__u32 handle;
> >>>> +
> >>>> +	/**
> >>>> +	 * @pad:
> >>>> +	 *
> >>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>> +	 */
> >>>>  	__u32 pad;
> >>>> +
> >>>> +	/**
> >>>> +	 * @offset:
> >>>> +	 *
> >>>> +	 * The mmap offset for the given GEM object. Set by the kernel upon
> >>>> +	 * successful completion of the IOCTL.
> >>>> +	 */
> >>>>  	__u64 offset;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_syncpt_read - parameters for the read syncpoint=
 IOCTL
> >>>> + */
> >>>>  struct drm_tegra_syncpt_read {
> >>>> +	/**
> >>>> +	 * @id:
> >>>> +	 *
> >>>> +	 * ID of the syncpoint to read the current value from.
> >>>> +	 */
> >>>>  	__u32 id;
> >>>> +
> >>>> +	/**
> >>>> +	 * @value:
> >>>> +	 *
> >>>> +	 * The current syncpoint value. Set by the kernel upon successful
> >>>> +	 * completion of the IOCTL.
> >>>> +	 */
> >>>>  	__u32 value;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_syncpt_incr - parameters for the increment sync=
point IOCTL
> >>>> + */
> >>>>  struct drm_tegra_syncpt_incr {
> >>>> +	/**
> >>>> +	 * @id:
> >>>> +	 *
> >>>> +	 * ID of the syncpoint to increment.
> >>>> +	 */
> >>>>  	__u32 id;
> >>>> +
> >>>> +	/**
> >>>> +	 * @pad:
> >>>> +	 *
> >>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>> +	 */
> >>>>  	__u32 pad;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_syncpt_wait - parameters for the wait syncpoint=
 IOCTL
> >>>> + */
> >>>>  struct drm_tegra_syncpt_wait {
> >>>> +	/**
> >>>> +	 * @id:
> >>>> +	 *
> >>>> +	 * ID of the syncpoint to wait on.
> >>>> +	 */
> >>>>  	__u32 id;
> >>>> +
> >>>> +	/**
> >>>> +	 * @thresh:
> >>>> +	 *
> >>>> +	 * Threshold value for which to wait.
> >>>> +	 */
> >>>>  	__u32 thresh;
> >>>> +
> >>>> +	/**
> >>>> +	 * @timeout:
> >>>> +	 *
> >>>> +	 * Timeout, in milliseconds, to wait.
> >>>> +	 */
> >>>>  	__u32 timeout;
> >>>> +
> >>>> +	/**
> >>>> +	 * @value:
> >>>> +	 *
> >>>> +	 * The new syncpoint value after the wait. Set by the kernel upon
> >>>> +	 * successful completion of the IOCTL.
> >>>> +	 */
> >>>>  	__u32 value;
> >>>>  };
> >>>> =20
> >>>>  #define DRM_TEGRA_NO_TIMEOUT	(0xffffffff)
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_open_channel - parameters for the open channel =
IOCTL
> >>>> + */
> >>>>  struct drm_tegra_open_channel {
> >>>> +	/**
> >>>> +	 * @client:
> >>>> +	 *
> >>>> +	 * The client ID for this channel.
> >>>> +	 */
> >>>>  	__u32 client;
> >>>> +
> >>>> +	/**
> >>>> +	 * @pad:
> >>>> +	 *
> >>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>> +	 */
> >>>>  	__u32 pad;
> >>>> +
> >>>> +	/**
> >>>> +	 * @context:
> >>>> +	 *
> >>>> +	 * The application context of this channel. Set by the kernel upon
> >>>> +	 * successful completion of the IOCTL. This context needs to be pa=
ssed
> >>>> +	 * to the DRM_TEGRA_CHANNEL_CLOSE or the DRM_TEGRA_SUBMIT IOCTLs.
> >>>> +	 */
> >>>>  	__u64 context;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_close_channel - parameters for the close channe=
l IOCTL
> >>>> + */
> >>>>  struct drm_tegra_close_channel {
> >>>> +	/**
> >>>> +	 * @context:
> >>>> +	 *
> >>>> +	 * The application context of this channel. This is obtained from =
the
> >>>> +	 * DRM_TEGRA_OPEN_CHANNEL IOCTL.
> >>>> +	 */
> >>>>  	__u64 context;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_get_syncpt - parameters for the get syncpoint I=
OCTL
> >>>> + */
> >>>>  struct drm_tegra_get_syncpt {
> >>>> +	/**
> >>>> +	 * @context:
> >>>> +	 *
> >>>> +	 * The application context identifying the channel for which to ob=
tain
> >>>> +	 * the syncpoint ID.
> >>>> +	 */
> >>>>  	__u64 context;
> >>>> +
> >>>> +	/**
> >>>> +	 * @index:
> >>>> +	 *
> >>>> +	 * Index of the client syncpoint for which to obtain the ID.
> >>>> +	 */
> >>>>  	__u32 index;
> >>>> +
> >>>> +	/**
> >>>> +	 * @id:
> >>>> +	 *
> >>>> +	 * The ID of the given syncpoint. Set by the kernel upon successful
> >>>> +	 * completion of the IOCTL.
> >>>> +	 */
> >>>>  	__u32 id;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_get_syncpt_base - parameters for the get wait b=
ase IOCTL
> >>>> + */
> >>>>  struct drm_tegra_get_syncpt_base {
> >>>> +	/**
> >>>> +	 * @context:
> >>>> +	 *
> >>>> +	 * The application context identifying for which channel to obtain=
 the
> >>>> +	 * wait base.
> >>>> +	 */
> >>>>  	__u64 context;
> >>>> +
> >>>> +	/**
> >>>> +	 * @syncpt:
> >>>> +	 *
> >>>> +	 * ID of the syncpoint for which to obtain the wait base.
> >>>> +	 */
> >>>>  	__u32 syncpt;
> >>>> +
> >>>> +	/**
> >>>> +	 * @id:
> >>>> +	 *
> >>>> +	 * The ID of the wait base corresponding to the client syncpoint. =
Set
> >>>> +	 * by the kernel upon successful completion of the IOCTL.
> >>>> +	 */
> >>>>  	__u32 id;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_syncpt - syncpoint increment operation
> >>>> + */
> >>>>  struct drm_tegra_syncpt {
> >>>> +	/**
> >>>> +	 * @id:
> >>>> +	 *
> >>>> +	 * ID of the syncpoint to operate on.
> >>>> +	 */
> >>>>  	__u32 id;
> >>>> +
> >>>> +	/**
> >>>> +	 * @incrs:
> >>>> +	 *
> >>>> +	 * Number of increments to perform for the syncpoint.
> >>>> +	 */
> >>>>  	__u32 incrs;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_cmdbuf - structure describing a command buffer
> >>>> + */
> >>>>  struct drm_tegra_cmdbuf {
> >>>> +	/**
> >>>> +	 * @handle:
> >>>> +	 *
> >>>> +	 * Handle to a GEM object containing the command buffer.
> >>>> +	 */
> >>>>  	__u32 handle;
> >>>> +
> >>>> +	/**
> >>>> +	 * @offset:
> >>>> +	 *
> >>>> +	 * Offset, in bytes, into the GEM object identified by @handle at
> >>>> +	 * which the command buffer starts.
> >>>> +	 */
> >>>>  	__u32 offset;
> >>>> +
> >>>> +	/**
> >>>> +	 * @words:
> >>>> +	 *
> >>>> +	 * Number of 32-bit words in this command buffer.
> >>>> +	 */
> >>>>  	__u32 words;
> >>>> +
> >>>> +	/**
> >>>> +	 * @pad:
> >>>> +	 *
> >>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>> +	 */
> >>>>  	__u32 pad;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_reloc - GEM object relocation structure
> >>>> + */
> >>>>  struct drm_tegra_reloc {
> >>>>  	struct {
> >>>> +		/**
> >>>> +		 * @cmdbuf.handle:
> >>>> +		 *
> >>>> +		 * Handle to the GEM object containing the command buffer for
> >>>> +		 * which to perform this GEM object relocation.
> >>>> +		 */
> >>>>  		__u32 handle;
> >>>> +
> >>>> +		/**
> >>>> +		 * @cmdbuf.offset:
> >>>> +		 *
> >>>> +		 * Offset, in bytes, into the command buffer at which to
> >>>> +		 * insert the relocated address.
> >>>> +		 */
> >>>>  		__u32 offset;
> >>>>  	} cmdbuf;
> >>>>  	struct {
> >>>> +		/**
> >>>> +		 * @target.handle:
> >>>> +		 *
> >>>> +		 * Handle to the GEM object to be relocated.
> >>>> +		 */
> >>>>  		__u32 handle;
> >>>> +
> >>>> +		/**
> >>>> +		 * @target.offset:
> >>>> +		 *
> >>>> +		 * Offset, in bytes, into the target GEM object at which the
> >>>> +		 * relocated data starts.
> >>>> +		 */
> >>>>  		__u32 offset;
> >>>>  	} target;
> >>>> +
> >>>> +	/**
> >>>> +	 * @shift:
> >>>> +	 *
> >>>> +	 * The number of bits by which to shift relocated addresses.
> >>>> +	 */
> >>>>  	__u32 shift;
> >>>> +
> >>>> +	/**
> >>>> +	 * @pad:
> >>>> +	 *
> >>>> +	 * Structure padding that may be used in the future. Must be 0.
> >>>> +	 */
> >>>>  	__u32 pad;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_waitchk - wait check structure
> >>>> + */
> >>>>  struct drm_tegra_waitchk {
> >>>> +	/**
> >>>> +	 * @handle:
> >>>> +	 *
> >>>> +	 * Handle to the GEM object containing a command stream on which to
> >>>> +	 * perform the wait check.
> >>>> +	 */
> >>>>  	__u32 handle;
> >>>> +
> >>>> +	/**
> >>>> +	 * @offset:
> >>>> +	 *
> >>>> +	 * Offset, in bytes, of the location in the command stream to perf=
orm
> >>>> +	 * the wait check on.
> >>>> +	 */
> >>>>  	__u32 offset;
> >>>> +
> >>>> +	/**
> >>>> +	 * @syncpt:
> >>>> +	 *
> >>>> +	 * ID of the syncpoint to wait check.
> >>>> +	 */
> >>>>  	__u32 syncpt;
> >>>> +
> >>>> +	/**
> >>>> +	 * @thresh:
> >>>> +	 *
> >>>> +	 * Threshold value for which to check.
> >>>> +	 */
> >>>>  	__u32 thresh;
> >>>>  };
> >>>> =20
> >>>> +/**
> >>>> + * struct drm_tegra_submit - job submission structure
> >>>> + */
> >>>>  struct drm_tegra_submit {
> >>>> +	/**
> >>>> +	 * @context:
> >>>> +	 *
> >>>> +	 * The application context identifying the channel to use for the
> >>>> +	 * execution of this job.
> >>>> +	 */
> >>>>  	__u64 context;
> >>>> +
> >>>> +	/**
> >>>> +	 * @num_syncpts:
> >>>> +	 *
> >>>> +	 * The number of syncpoints operated on by this job.
> >>>> +	 */
> >>>>  	__u32 num_syncpts;
> >>>> +
> >>>> +	/**
> >>>> +	 * @num_cmdbufs:
> >>>> +	 *
> >>>> +	 * The number of command buffers to execute as part of this job.
> >>>> +	 */
> >>>>  	__u32 num_cmdbufs;
> >>>> +
> >>>> +	/**
> >>>> +	 * @num_relocs:
> >>>> +	 *
> >>>> +	 * The number of relocations to perform before executing this job.
> >>>> +	 */
> >>>>  	__u32 num_relocs;
> >>>> +
> >>>> +	/**
> >>>> +	 * @num_waitchks:
> >>>> +	 *
> >>>> +	 * The number of wait checks to perform as part of this job.
> >>>> +	 */
> >>>>  	__u32 num_waitchks;
> >>>> +
> >>>> +	/**
> >>>> +	 * @waitchk_mask:
> >>>> +	 *
> >>>> +	 * Bitmask of valid wait checks.
> >>>> +	 */
> >>>>  	__u32 waitchk_mask;
> >>>> +
> >>>> +	/**
> >>>> +	 * @timeout:
> >>>> +	 *
> >>>> +	 * Timeout, in milliseconds, before this job is cancelled.
> >>>> +	 */
> >>>>  	__u32 timeout;
> >>>> +
> >>>> +	/**
> >>>> +	 * @syncpts:
> >>>> +	 *
> >>>> +	 * A pointer to @num_syncpts &struct drm_tegra_syncpt structures t=
hat
> >>>
> >>> I'm not sure whether this "pointer to @num_syncpts" makes sense, shou=
ldn't it be:
> >>>
> >>> 	A pointer to &struct drm_tegra_syncpt structures that...
> >>>
> >>> ?
> >>>
> >>> Same for the @cmdbufs/@relocs/@waitchks members.
> >>
> >> I wanted to have the references to those fields in the text so that it
> >> becomes obvious that num_syncpts defines the number of entries in this
> >> syncpts array.
> >>
> >> Perhaps a better formulation would be:
> >>
> >> 	A pointer to an array of @num_syncpts &struct drm_tegra_syncpt
> >> 	structure that...
> >>
> >> ?
>=20
> That variant is good to me.
>=20
> >=20
> > Another alternative may be:
> >=20
> > 	/**
> > 	 * @syncpts:
> > 	 *
> > 	 * A pointer to an array of &struct drm_tegra_syncpt structure that
> > 	 * specify the syncpoint operations performed as part of this job.
> > 	 * The number of elements in the array must be equal to the value
> > 	 * given by @num_syncpts.
> > 	 */
> >=20
> > That's slightly easier to read but also very explicit in relating both
> > fields to one another. Perhaps a two-way link can be established by
> > adding something like this to the description of @num_syncpts:
> >=20
> > 	/**
> > 	 * @num_syncpts:
> > 	 *
> > 	 * The number of syncpoints operated on by this job. This defines
> > 	 * the length of the array pointed to by @syncpts.
> > 	 */
>=20
> But this variant is even better.
>=20
> I don't mind either way, choose what you prefer.

I went with the latter. I've updated all of these field descriptions and
added your Reviewed-by. Pushed everything to drm/tegra/for-next and will
send a pull request for that branch shortly.

Thierry

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr/UqMACgkQ3SOs138+
s6GUrxAAwocHCB5pwj3YvT6HWwTSrwVTU44GcUOSt7DQMtUW2PWvtbzVhhQ2GL/U
bCBGqQgea0yBtIUTw7ZHVIkGAUgDaQ5MQR86IQC5fzW9Etc2G4rK9YCn+EcTQ1Yd
VwvePxvD+jXwYK5foYdrqtgPERy8R18JhFZQ0i/NFp9albR7kGsyLpuGOadABQHf
KnUdNPc+zeDoozPH+JwwSS2PZSSmHV54vwsKGiEAVXLXpO58sQ7w4opBwJNl6BNU
KV+srRomYlB6Lgx/eP2tQnL/zrj5esxt1g/lAcCg+pppJI8bO/KlC5OCI0UU0/6A
b0Kh/ohdiqVc/8qvA6OG6mo1Wo8LCci+XFQ+anv35UUz9Iiex+v+UNCf8jBG++pI
wyLpWk47ibj3eknYPxNBBXOA6BBTGdAyBXe8YSMFR5/2p+Xk0INXBBAIWuLj7j2N
uNOpIqkUUrvz9fcDCstznqPdevC35nJwoeZ3m+L5yCDaVSzeO1fm0+F1rQjLWrTC
ruqWk83ioK/paDnJt2uBiwg2GVLaK+pUZKmUH2DdadpqMajY/A+t8u2vW42emm0F
x0LXPBxjJYzHzXU7ebx4BsDYITPXiYYy8Fw03K9Yc2+XqrhTIv6cMxoEh0CAkous
O7I8tKPdHnd+ke29vplJ7YAmQGRhsKmASsasUduoePL6OuI12LY=
=575d
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--

--===============0643957006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0643957006==--
